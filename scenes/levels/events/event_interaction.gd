extends InteractionManager

func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	match Global.progress:
		0: start_interaction("event_1")
		1: start_interaction("event_2")
		2: start_interaction("event_3")
		3: start_interaction("event_4")
		4: start_interaction("event_5")

func dialogic_signals(arg) -> void:
	pass


func end_dialog() -> void:
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_dialog)
