extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func lift_all() -> void:
	$Vignette/AnimationPlayer.play_backwards("fade_out")
	$BlackButPlayer/AnimationPlayer.play_backwards("fade out")
	$SceneTransitionRect/AnimationPlayer.play_backwards("Fade")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
