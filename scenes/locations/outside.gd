extends Node

@onready var boundary_left = $Base.boundary_left
@onready var boundary_right = $Base.boundary_right
@onready var boundary_top = $Base.boundary_top
@onready var boundary_bottom = $Base.boundary_bottom

func _ready() -> void:
	set_camera_limits()
	
func set_camera_limits():
	$Player/Camera2D.limit_left = boundary_left
	$Player/Camera2D.limit_right = boundary_right
	$Player/Camera2D.limit_top = boundary_top
	$Player/Camera2D.limit_bottom = boundary_bottom

func _physics_process(delta: float) -> void:
	pass
