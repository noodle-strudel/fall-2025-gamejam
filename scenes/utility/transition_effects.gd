extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play_effect(effect: String) -> void:
	match effect:
		"player_fade_in":
			$TransitionEffects/FullBlack/AnimationPlayer.play("fade_out")
		"player_fade_out":
			$TransitionEffects/FullBlack/AnimationPlayer.play_backwards("fade_out")
		"background_fade_in":
			$BackgroundBlack/AnimationPlayer.play_backwards("Fade")
		"background_fade_out":
			$TransitionEffects/FullBlack/AnimationPlayer.play_backwards("fade_out")
		"vignette_fade_in":
			$TransitionEffects/Vignette/AnimationPlayer.play_backwards("fade_out")
		"vignette_fade_out":
			$TransitionEffects/Vignette/AnimationPlayer.play("fade_out")
		"blur":
			$TransitionEffects/Blur/AnimationPlayer.play_backwards("fade_out")
		"unblur":
			$TransitionEffects/Blur/AnimationPlayer.play("fade_out")


func lift_all() -> void:
	$TransitionEffects/Vignette/AnimationPlayer.play("fade_out")
	$TransitionEffects/FullBlack/AnimationPlayer.play("fade_outout")
	$TransitionEffects/Blur/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
