extends InteractionManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	
	#Check if player got the key from the statue
	start_interaction("garden_door_interact")
	if Global.has_key == false:
		pass
	else:
		$SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
		$SceneTransitionRect.transition_to()
		#scene transition!!!

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func dialogic_signals(arg) -> void:
	if arg is String:
		pass
	else:
		pass
		#var functions = arg.keys()
		#if functions[0] == "drip_sfx":
			#SoundEffects.drip_sfx(arg["drip_sfx"])

func end_dialog() -> void:
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_dialog)
