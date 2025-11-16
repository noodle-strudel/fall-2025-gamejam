extends Node

var boundary_left = -700
var boundary_right = 700
var boundary_top = 400
var boundary_bottom = -400
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_camera_limits()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_camera_limits():
	$Player/Camera2D.limit_left = boundary_left
	$Player/Camera2D.limit_right = boundary_right
	$Player/Camera2D.limit_top = boundary_top
	$Player/Camera2D.limit_bottom = boundary_bottom

func set_boundary():
	pass
	
