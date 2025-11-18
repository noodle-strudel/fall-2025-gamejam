extends Node

@export var boundary_left = -700
@export var boundary_right = 700
@export var boundary_top = -400
@export var boundary_bottom = 400
@onready var boundary_limits = $LevelBoundary/CollisionPolygon2D
@onready var player_camera

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	set_boundary()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("options"):
		pass


func set_boundary():
	boundary_limits.polygon = PackedVector2Array([Vector2(boundary_left, boundary_top), Vector2(boundary_right, boundary_top), Vector2(boundary_right, boundary_bottom), Vector2(boundary_left, boundary_bottom)])
