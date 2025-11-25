extends InteractionManager

signal end_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(dialogic_signals)

func receive_interaction() -> void:
	Global.player_state = Global.State.INTERACTING
	# Player has been inside but hasn't watched event
	if Global.has_key and Global.been_inside:
		start_interaction("statue_go_back")
	# Player hasn't been inside yet
	elif Global.has_key:
		start_interaction("statue_already_interacted")
	# Player doesn't have key
	elif !Global.awaken_first:
		start_interaction("statue_intro")
	else:
		match Global.progress:
			1: start_interaction("statue1")
			2: start_interaction("statue2")
			3: start_interaction("statue3")
			4: start_interaction("statue4")
			5: start_interaction("statue5")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func dialogic_signals(arg) -> void:
	if arg is String:
		if arg == "end_game":
			end_game.emit()
	if arg is Dictionary:
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])

#func _end_dialog() -> void:
	#Global.player_state = Global.State.MOVING
	#Dialogic.timeline_ended.disconnect(_end_dialog)
