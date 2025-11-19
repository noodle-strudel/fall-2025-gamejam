extends Node2D

@onready var vignette_anim = $VignetteCanvasLayer/Vignette/AnimationPlayer
@onready var black_but_player_anim = $BlackButPlayerCanvasLayer/BlackButPlayer/AnimationPlayer
@onready var scene_transition_anim = $SceneTransitionCanvasLayer/SceneTransitionRect/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func lift_all() -> void:
	vignette_anim.play("fade_out")
	black_but_player_anim.play("fade_out")
	scene_transition_anim.play_backwards("Fade")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
