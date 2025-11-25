extends InteractionManager

signal scene_transition
signal fade_out
signal blur
signal unblur

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_dialogic_signals)


func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	if !Global.is_inside:
		# Player has been inside but not interacted: let player in without repeating unlock dialogue
		if Global.has_key and Global.been_inside:
			SoundEffects.play("door_open")
			scene_transition.emit()
		# First time unlocking door this phase
		elif Global.has_key:
			start_interaction("outside_door_unlock")
		# Player doesn't have key. Different dialogue if player has been inside and lost the key
		else:
			start_interaction("outside_door_locked")
	else:
		start_interaction("inside_door_interact")


func _dialogic_signals(arg) -> void:
	if arg is String:
		# Emitted when player is allowed to proceed
		if arg == "scene_transition":
			scene_transition.emit()
		elif arg == "background_fade_out":
			fade_out.emit()
		elif arg == "blur":
			blur.emit()
		elif arg == "unblur":
			unblur.emit()
		# One-off sound effect signals
		elif arg.ends_with("_sfx"):
			SoundEffects.play(arg.trim_suffix("_sfx"))
	else: # arg is dictionary
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])
