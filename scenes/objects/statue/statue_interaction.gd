extends InteractionManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Dialogic.timeline_ended.connect(end_dialog)
	match Global.progress:
		0:
			if !Global.has_key: #statue hasn't been talked to yet
				start_interaction("statue_intro")
			else:
				start_interaction("statue_intro_finished")
		1:
			if !Global.has_key:
				start_interaction("statue1")
			else:
				start_interaction("statue1_finished")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func dialogic_signals(arg) -> void:
	if arg is Dictionary:
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])

func end_dialog() -> void:
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_dialog)
