extends Node2D

export var command = "x"
export var openTime = 1.0

var open = 0.0
var target = 0.0
var base_rotation = PI
var ship

func _ready():
	ship = get_parent()
	base_rotation = rotation

func fire(p):
	target = p

var last = 0
func avFeedback():
	last = open

func _physics_process(delta):
	
	var d = delta / openTime
	if open < target:
		open += d
	if open > target:
		open -= d
		
	avFeedback()
	open = clamp(open, 0.0, 1.0)
	rotation = base_rotation + (open * PI)
