extends Level

func _ready() -> void:
	super._ready()
	# First time awakening
	if Global.awaken_first == false:
		Global.player_state = Global.State.INTERACTING
		Dialogic.start("beginning")
		Dialogic.timeline_ended.connect(_end_beginning_dialog)
		Dialogic.signal_event.connect(_dialogic_signals)
	# If you've already awaken
	else:
		Global.is_inside = false
		Global.player_state = Global.State.MOVING
		# No need to obscure everything
		$TransitionEffects/Vignette/AnimationPlayer.play("fade_out")
		$TransitionEffects/BlackButPlayer/AnimationPlayer.play("fade_out")
		$TransitionEffects/SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
	
	Dialogic.signal_event.connect(_dialogic_signals)
	# Connect to door scene transition signals
	
	$Door/InteractionManager.scene_transition.connect(_enter_room)


# Called when door dialogic timeline signals to enter room
func _enter_room() -> void:
	var room
	$Door/InteractionManager.scene_transition.disconnect(_enter_room)
	Global.is_inside = true
	match Global.progress:
		0: go_to_scene("ROOM1")
		1: go_to_scene("ROOM2")
		2: go_to_scene("ROOM3")
		3: go_to_scene("ROOM4")
		4: go_to_scene("ROOM5")
	
	#SceneManager.switch_scene(Global.scenes[room])

func _end_beginning_dialog():
	if Global.awaken_first == false:
		Global.awaken_first = true
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(_end_beginning_dialog)
	Dialogic.signal_event.disconnect(_dialogic_signals)
