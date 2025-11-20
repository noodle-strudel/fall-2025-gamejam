extends Node2D

class_name Level

func _ready() -> void:
	if Global.debug_mode:
		$CanvasLayer/Debug.show()


func scene_transition(level: String) -> void:
	$TransitionEffects.scene_transition_anim.play("Fade")
	SceneManager.switch_scene(Global.scenes[level])


# Common dialogic signals
func dialogic_signals(arg) -> void:
	if arg is String:
		if arg == "player_fade_in":
			$TransitionEffects.scene_transition_anim.play_backwards("Fade")
		if arg == "background_fade_in":
			$TransitionEffects.black_but_player_anim.play("fade_out")
		if arg == "vignette_fade_out":
			$TransitionEffects.vignette_anim.play("fade_out")
		if arg == "vignette_fade_in":
			$TransitionEffects.vignette_anim.play_backwards("fade_out")
	else: # arg is dictionary
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])
