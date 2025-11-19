extends InteractionManager

signal scene_transition
signal fade_out

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	start_interaction("garden_door_interact")


func dialogic_signals(arg) -> void:
	if arg is String:
		# Emitted when player is allowed to proceed
		if arg == "scene_transition":
			scene_transition.emit()
		elif arg == "background_fade_out":
			fade_out.emit()
		# One-off sound effect signals
		elif arg.ends_with("_sfx"):
			SoundEffects.play(arg.trim_suffix("_sfx"))
	else: # arg is dictionary
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])
		pass


func end_dialog() -> void:
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_dialog)
