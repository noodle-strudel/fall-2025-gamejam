extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Doesn't work
func lift_all() -> void:
	$Vignette/AnimationPlayer.play("fade_out")
	$BlackButPlayer/AnimationPlayer.play("fade_outout")
	$Blur/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
