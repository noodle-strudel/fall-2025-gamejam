extends Level

func _ready() -> void:
	super._ready()
	# First time awakening
	if Global.awaken_first == false:
		Global.player_state = Global.State.INTERACTING
		Dialogic.start("beginning")
		Dialogic.timeline_ended.connect(_end_beginning_dialog)
		Dialogic.signal_event.connect(_dialogic_signals)
		Dialogic.signal_event.connect(_wake_protag)
		$Player.z_index = 1
		$Player.lay_down()
	# If you've already awaken
	else:
		# Move player to outside door
		$Player.position = Vector2(119.0, -983.0)
		# TODO player facing down after exiting door
		$Player/AnimationPlayer.play("idledown")
		Global.is_inside = false
		Global.player_state = Global.State.MOVING
		# No need to obscure everything
		lift_all_effects()
	
	Dialogic.signal_event.connect(_dialogic_signals)
	# Connect to door scene transition signals
	$Door/InteractionManager.scene_transition.connect(_enter_room)
	# Connect to statue end game signal
	$Statue/InteractionManager.end_game.connect(_end_game)


func _end_game() -> void:
	SceneManager.switch_scene(Global.scenes["MAIN_MENU"])


# Called when door dialogic timeline signals to enter room
func _enter_room() -> void:
	var room
	$Door/InteractionManager.scene_transition.disconnect(_enter_room)
	Global.is_inside = true
	match Global.progress:
		1: go_to_scene("ROOM1")
		2: go_to_scene("ROOM2")
		3: go_to_scene("ROOM3")
		4: go_to_scene("ROOM4")
		5: go_to_scene("ROOM5")
	
	#SceneManager.switch_scene(Global.scenes[room])

func _end_beginning_dialog():
	if Global.awaken_first == false:
		$Player.z_index = 0
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(_end_beginning_dialog)
	Dialogic.signal_event.disconnect(_dialogic_signals)

func _wake_protag(arg):
	if arg is String and arg == "get_up":
		$Player.get_up()
