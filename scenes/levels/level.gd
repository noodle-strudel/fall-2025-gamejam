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
	#$TransitionEffects/TransitionEffects/Blur.hide()
	if Global.debug_mode:
		$Overlays/Debug.show()
		$Player.speed = 1000
	else:
		$Overlays/Debug.hide()


func lift_effects() -> void:
	$TransitionEffects.lift_all()
	#$TransitionEffects/TransitionEffects/Vignette/AnimationPlayer.play("fade_out")
	#$TransitionEffects/TransitionEffects/FullBlack/AnimationPlayer.play("fade_out")
	#$TransitionEffects/TransitionEffects/Blur/AnimationPlayer.play("fade_out")


# Fade in scene transition layer and switch to new scene
func go_to_scene(level: String) -> void:
	var transition_anim = $TransitionEffects/TransitionEffects/FullBlack
	if transition_anim.visible == false: # Check if screen is already black
		transition_anim.AnimationPlayer.play_backwards("Fade")
		# TODO test this
	SceneManager.switch_scene(Global.scenes[level])


# Common dialogic signals
# Add all generic or multi-purpose dialogic signal implementations here
# e.g. sound effects, transition effects, sprite animations, etc.
func _dialogic_signals(arg) -> void:
	if arg is String:
		# One-off sound effect
		if arg.ends_with("_sfx"):
			SoundEffects.play(arg.trim_suffix("_sfx"))
		elif arg.ends_with("_bgm"):
			BackgroundMusic.play(arg.trim_suffix("_bgm"))
		else:
			match arg:
				"sit_down":
					Global.player_state = Global.State.SITTING
				"stand_up": 
					$Player.get_up()
					Global.player_state = Global.State.INTERACTING
				"end_game":
					SceneManager.switch_scene(Global.scenes["MAIN_MENU"])
				# Transition effects
				_:
					$TransitionEffects.play_effect(arg)
					
	elif arg is Dictionary:
		# Looping sound effects
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])
