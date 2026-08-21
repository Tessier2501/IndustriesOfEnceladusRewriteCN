extends CollisionPolygon2D

export  var repairReplacementPrice = 1000
export  var repairReplacementTime = 1
export  var repairFixPrice = 1000
export  var repairFixTime = 1
onready var slotName = "CargoAux_" + systemName

export var mass = 1000
export  var systemName = "SYSTEM_CARGO_AUX"
export  var slot = "cargo.aux"

export  var registerExternal = false

export var mirrorCollider = false
export var mirrorVertical = false
export (Vector2) var mirrorCentreOffset = Vector2(0,0)
var set_rot = 0.0

var pointers

var ship

func _ready():
	pointers = ModLoader._savedObjects[0]
	ship = getShip()
	self.name = systemName
	ship.registerCapability(slot, systemName)
	if ship.getConfig(slot) != systemName:
		Tool.remove(self)
	else:
		visible = true
		if registerExternal:
			ship.externalSystems.append(self)
	if not ship.setup:
		yield(ship,"setup")
	make_mirror()

func make_mirror():
	self.rotation = -deg2rad(set_rot)
	var current_pos = self.position
	var new_position = pointers.DataFormat.__rotate_point(current_pos,set_rot)
	self.position = new_position
	var has = ship.getConfig(slot) == systemName
	if has and mirrorCollider:
		var colliderName = systemName + "_COLLIDER_MIRROR"
		var node = ship.get_node_or_null(colliderName)
		var selfScale = self.scale
		if node:
			node.set_polygon(make_poly())
			node.set_position(modify_position())
			node.rotation = deg2rad(set_rot)
			node.scale = selfScale
		else:
			var copy = CollisionPolygon2D.new()
			copy.name = colliderName
			copy.visible = true
			copy.z_index = self.z_index
			copy.set_polygon(make_poly())
			copy.set_build_mode(self.build_mode)
			copy.set_disabled(false)
			copy.set_one_way_collision(self.one_way_collision)
			copy.set_one_way_collision_margin(self.one_way_collision_margin)
			copy.scale = selfScale
			copy.set_position(modify_position())
			copy.rotation = deg2rad(set_rot)
			copy.set_script(null)
			ship.call_deferred("add_child",copy)
			$Mirror.visible = false
			$Mirror.disabled = true

func modify_position() -> Vector2:
	var selfPos = self.get_position()
	var rv = (float(1)/float(2))*float(set_rot)
	var nselfPos = pointers.DataFormat.__rotate_point(selfPos,rv)
	var modifyP = Vector2(nselfPos[0], nselfPos[1])
	if mirrorVertical:
		modifyP[1] = -modifyP[1]
	else:
		modifyP[0] = -modifyP[0]
	var newpos = modifyP + mirrorCentreOffset
	return newpos

func make_poly() -> PoolVector2Array:
	var poly = self.polygon
	var newPoly = PoolVector2Array()
	for vec in poly:
		if mirrorVertical:
			var newVec = Vector2(vec[0],-vec[1])
			newPoly.append(newVec)
		else:
			var newVec = Vector2(-vec[0],vec[1])
			newPoly.append(newVec)
	return newPoly

func getShip():
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c
