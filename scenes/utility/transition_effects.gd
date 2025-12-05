extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


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
		"consumption":
			$TransitionEffects/ConsumptionEnd.show()
		"reconciliation":
			$TransitionEffects/ReconciliationEnd.show()


func lift_all() -> void:
	$TransitionEffects/Blur.material.set_shader_parameter("blur_amount", 0)
	$TransitionEffects/Vignette.material.set_shader_parameter("alpha", 0)
	$BackgroundBlack.color = Color("transparent")
	#$TransitionEffects/FullBlack.color = Color("transparent")
	#$TransitionEffects/Vignette/AnimationPlayer.play("fade_out")
	#$TransitionEffects/FullBlack/AnimationPlayer.play("fade_out")
	#$TransitionEffects/Blur/AnimationPlayer.play("fade_out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
