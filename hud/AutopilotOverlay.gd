extends "res://hud/AutopilotOverlay.gd"

func _draw():
	var lidarNode = ship.lidar
	
	if lidarNode and autopilotType == "SYSTEM_AUTOPILOT_337MOD":
		drawLidar(lidarNode, ship.get_global_transform_with_canvas().origin, overcircle, lidarSize)
