extends InteractionManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	var room
	match Global.progress:
		0: room = "ROOM1"
		1: room = "ROOM2"
		2: room = "ROOM3"
		3: room = "ROOM4"
		4: room = "ROOM5"
	$SceneTransitionRect.next_scene_path = Global.location_path_root + Global.location_path[room]
	start_interaction("garden_door_interact")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func dialogic_signals(arg) -> void:
	if arg is String:
		if arg == "scene_transition":
			$SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
			$SceneTransitionRect.transition_to()
	else:
		pass

func end_dialog() -> void:
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_dialog)
