extends InteractionManager

signal dialogic_signals(arg: String)

func _ready() -> void:
	Dialogic.signal_event.connect(_dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	# Player has been inside but hasn't watched event
	if Global.has_interacted:
		start_interaction("event_already_interacted")
	# Player hasn't been inside yet
	else: 
		match Global.progress:
			1: start_interaction("event1")
			2: start_interaction("event2")
			3: start_interaction("event3")
			4: start_interaction("event4")
			5: start_interaction("event5")

func _dialogic_signals(arg) -> void:
	if arg is String:
		dialogic_signals.emit(arg)


func end_dialog() -> void:
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_dialog)
