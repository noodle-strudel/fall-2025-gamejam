# Base level class
# Takes care of basic stuff every level needs to be able to do
# e.g. scene transitions, showing debug menu, basic dialogic signals
class_name Level extends Node2D

# Instantiate in new level:
# - LevelBoundary
# - Player
# - TransitionEffects
# - Overlays

func _ready() -> void:
	if Global.debug_mode:
		$Overlays/Debug.show()
		$Player.speed = 1000
	else:
		$Overlays/Debug.hide()
	$Door/InteractionManager.fade_out.connect(_fade_out)


# Called when door signals to fade out
func _fade_out() -> void:
	$TransitionEffects/SceneTransitionRect/AnimationPlayer.play("Fade")
	$Door/InteractionManager.fade_out.disconnect(_fade_out)	


# Fade in scene transition layer and switch to new scene
func go_to_scene(level: String) -> void:
	var transition_anim = $TransitionEffects/SceneTransitionRect
	if transition_anim.visible == false: # Check if screen is already black
		transition_anim.AnimationPlayer.play("Fade")
		# TODO test this
	SceneManager.switch_scene(Global.scenes[level])


# Common dialogic signals
func _dialogic_signals(arg) -> void:
	if arg is String:
		# One-off sound effect
		if arg.ends_with("_sfx"):
			SoundEffects.play(arg.trim_suffix("_sfx"))
		else:
			match arg:
				"player_fade_in":
					#$TransitionEffects.scene_transition_anim.play_backwards("Fade")
					$TransitionEffects/SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
				"player_fade_out":
					$TransitionEffects/SceneTransitionRect/AnimationPlayer.play("Fade")
				"background_fade_in":
					#$TransitionEffects.black_but_player_anim.play("fade_out")
					$TransitionEffects/BlackButPlayer/AnimationPlayer.play("fade_out")
				"vignette_fade_out":
					#$TransitionEffects.vignette_anim.play("fade_out")
					$TransitionEffects/Vignette/AnimationPlayer.play("fade_out")
				"vignette_fade_in":
					#$TransitionEffects.vignette_anim.play_backwards("fade_out")
					$TransitionEffects/Vignette/AnimationPlayer.play_backwards("fade_out")
					
	elif arg is Dictionary:
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])
