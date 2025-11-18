extends InteractionManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	var room
	#$SceneTransitionRect.next_scene_path = Global.scene[room]
	start_interaction("garden_door_interact")

func scene_transition() -> void:
	var room
	match Global.progress:
		0: room = "ROOM1"
		1: room = "ROOM2"
		2: room = "ROOM3"
		3: room = "ROOM4"
		4: room = "ROOM5"
	SceneManager.switch_scene(Global.scenes[room])


func dialogic_signals(arg) -> void:
	if arg is String:
		if arg == "scene_transition":
			$SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
			scene_transition()
			#$SceneTransitionRect.transition_to()
		# Play single sound effects
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
