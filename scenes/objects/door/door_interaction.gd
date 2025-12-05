extends InteractionManager

signal scene_transition
signal dialogic_signals

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_dialogic_signals)


func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	if !Global.is_inside:
		# Player has been inside but not interacted: let player in without repeating unlock dialogue
		if Global.has_key:
			#SoundEffects.play("door_open")
			#scene_transition.emit()
		# First time unlocking door this phase
		#elif Global.has_key:
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
		# Generic dialogic signals handled by level base class
		else:
			dialogic_signals.emit(arg)
	else: # arg is dictionary
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])
