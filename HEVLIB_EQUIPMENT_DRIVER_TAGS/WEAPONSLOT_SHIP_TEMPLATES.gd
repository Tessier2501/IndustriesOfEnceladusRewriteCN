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
# 4. The source code and the binary form, and any modifications made to them may not be used for the purpose of input data, the training of, or improvement of machine learning algorithms,
# including but not limited to artificial intelligence, natural language processing, or data mining. This condition applies to any derivatives,
# modifications, or updates based on the Software code. Any usage of the source code or the binary form in an AI-training dataset is considered a breach of this License.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# [/license]

const WEAPONSLOT_SHIP_TEMPLATES = {
	"SHIP_OCP209":{
		"leftBay1":{
			"MINING_COMPANIONS":[
				{
				"property":"position",
				"value":"Vector2( 0, 210 )"
				}
			],
			"CLAIM_BEACONS":[
				{
					"property":"position",
					"value":"Vector2( -25, 196 )"
				}
			]
		},
		"leftBay3":{
			"MINING_COMPANIONS":[
				{
				"property":"position",
				"value":"Vector2( 0, 210 )"
				}
			]
		},
		"rightBay1":{
			"MINING_COMPANIONS":[
				{
				"property":"position",
				"value":"Vector2( 0, 210 )"
				}
			],
			"CLAIM_BEACONS":[
				{
					"property":"position",
					"value":"Vector2( 25, 196 )"
				}
			]
		},
		"rightBay3":{
			"MINING_COMPANIONS":[
				{
					"property":"position",
					"value":"Vector2( 0, 210 )"
				}
			]
		},
	},
	"SHIP_OBERON":{
		"mainLeft":{
			"MANIPULATION_ARMS":[
				{
					"property":"feedVelocity",
					"value":"Vector2( -60, -280 )"
				},
				{
					"property":"flip",
					"value":"true"
				}
			],
			"MASSDRIVERS":[
				{
					"property":"position",
					"value":"Vector2( 0,-90 )"
				}
			],
		},
		"mainRight":{
			"MANIPULATION_ARMS":[
				{
					"property":"feedVelocity",
					"value":"Vector2( 60, -280 )"
				}
			],
			"MASSDRIVERS":[
				{
					"property":"position",
					"value":"Vector2( 0,-90 )"
				}
			],
		},
	},
	"SHIP_PROSPECTOR":{
		"left":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( 30, -80 )"
				}
			]
		},
		"right":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( -30, -80 )"
				}
			]
		}
	},
	"SHIP_PROSPECTOR_BALD":{
		"left":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( 30, 130 )"
				}
			]
		},
		"right":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( -30, 130 )"
				}
			]
		}
	},
	"SHIP_ATLAS_WASP":{
		"left":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( 25, 130 )"
				}
			]
		},
		"right":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( -25, 130 )"
				}
			]
		}
	},
	"SHIP_AT225":{
		"middleLeft":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( 40, 100 )"
				}
			]
		},
		"middleRight":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( -40, 100 )"
				}
			]
		}
	},
	"SHIP_TSUKUYOMI_IOT":{
		"left":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( 50, 100 )"
				}
			]
		},
		"right":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( -50, 100 )"
				}
			]
		}
	},
	"SHIP_TRTL_PEEPER":{
		"left":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( 105, 90 )"
				}
			]
		},
		"right":{
			"MANIPULATION_ARMS":[
				{
					"property":"position",
					"value":"Vector2( -105, 90 )"
				}
			]
		}
	}
}
