# [license]
# 3-Clause BSD NON-AI License
# 
# Copyright 2026 __hev (Benjamin Buckhurst)
# 
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
# 
# 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the distribution.
# 
# 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products
# derived from this software without specific prior written permission.
# 
# 4. The source code and the binary form, and any modifications made to them may not be used for the purpose of input data, reference code snippets and/or files, OR used in the training of, or improvement of machine learning algorithms,
# including but not limited to artificial intelligence, natural language processing, or data mining. This condition applies to any derivatives,
# modifications, or updates based on the Software code. Any usage of the source code or the binary form may not be present in any form as data fed, inputted, or provided to an AI, or present in any AI-training dataset is considered a breach of this License.
# 
# 5. Any projects deriving work from this project MUST include a copy of this license and all other license and/or copyright agreements posed within other source material,
# all of which must be followed to its entirety. Failure to follow these licenses prohibit all modification and redistribution of the material until all licensing has been reinstated.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# [/license]

extends "res://ships/ship-ctrl.gd"

export var crewBonus = 0

#var base_capacity = 3000
#var base_cargo_type = "divided"
#
#var bay_aux_capacity = 0
#var hold_kit_capacity = 0
#
#func _ready():
#	CurrentGame.validateEmployment()
#	base_capacity = processedCargoCapacity
#	base_cargo_type = processedCargoStorageType

#func _process(delta):
#
#	if hold_kit_capacity > 0:
#		breakpoint;
#
#	processedCargoCapacity = base_capacity + bay_aux_capacity + hold_kit_capacity
	
#func handleAmmoDelivery(delta):
#	match massDriverMagazine:
#		100000:
#			var ps = 1000
#			availableAmmoToDrawNow = clamp(availableAmmoToDrawNow + delta * ps, 0, ps)
#		_:
#			.handleAmmoDelivery(delta)


func sensorGet(sensor):
	match sensor:
		"hold":
			match processedCargoStorageType:
				"divided":
					return processedCargoCapacity * CurrentGame.traceMinerals.size()
				"amorphic":
					return processedCargoCapacity
				"mono":
					return processedCargoCapacity
		"hold.fill":
			return getProcessedCargoMass() / sensorGet("hold")
		"crew.quality":
			return crewMoraleBonus + 1
		_:
			return .sensorGet(sensor)

func hasFbw()->bool:
	var typePatch = getAutopilotType()
	
	match typePatch:
		"SYSTEM_AUTOPILOT_337MOD":
			return true
		_:
			return .hasFbw()
	
func autopilotControl(delta, fbw = false):
	var solveThrust = false
	var observeRotation = false
	var computeRotation = false
	
	.autopilotControl(delta, hasFbw())
	
	var typePatch = getAutopilotType()
	
	match (typePatch):
		"SYSTEM_AUTOPILOT_337MOD":
			solveThrust = true
			observeRotation = true
			computeRotation = false
# don't know how, don't know why, but this is necessary
# this is gonna be a bastard to update every time a patch affects this code
# sorry in advance
		"SYSTEM_AUTOPILOT_MK4":
			solveThrust = true
			observeRotation = true
			computeRotation = true
			if not ai:
				aiImperativeStrenght = 100.0
				aiImperative = AI.go
				var rotationOverride = autopilotDesiredRotation
				if autopilotVelocityOffsetTarget:
					aiImperativeTarget = autopilotVelocityOffsetTarget
					if Input.is_action_pressed("autopilot_stop"):
						aiImperative = AI.shadow
					else :
						if CurrentGame.isValidCargo(aiImperativeTarget):
							aiImperative = AI.catch
						else :
							aiImperative = AI.watch
				else :
					aiImperative = AI.go
					aiImperativeTarget = null
				if autopilotVectorAdjust or autopilotVelocityOffsetTarget or autopilotHeadingAdjust:
					if not adjustingAI:
						autopilotDesiredVelocity = aiImperativeDirection
						mouseOffsetForAutopilotDesiredVelocity = autopilotDesiredVelocity
						adjustingAI = true
					else :
						aiImperativeDirection = autopilotDesiredVelocity
				else :
					adjustingAI = false

				if not cutscene and not autopilotVectorAdjust and not fbw and not autopilotHeadingAdjust and not trajectoryTarget:
					aiControl(lastDelta)
				if autopilotHeadingAdjust:
					autopilotDesiredRotation = rotationOverride
			else :
				adjustingAI = false

# done to make crew count increases work
# i call setupShip to safe crew count increases prior to actually increasing
# them with CrewModifiers
func setupShip():
	self.setConfig("crewCount", crew)
	.setupShip()
