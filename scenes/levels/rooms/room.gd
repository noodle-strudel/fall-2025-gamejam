class_name Room extends Level

func _ready() -> void: 
	super._ready()
	lift_effects()
	# Play event preamble
	if !Global.been_inside:
		Dialogic.timeline_ended.connect(_end_preamble)
		Global.player_state = Global.State.INTERACTING
		Dialogic.start("event_preamble", str(Global.progress))
		Global.been_inside = true
	else:
		Global.player_state = Global.State.MOVING
		$TransitionEffects.play_effect("player_fade_in")

	# Connect to door signals when leaving room
	$Door/InteractionManager.scene_transition.connect(_leave_room)
	$Door/InteractionManager.dialogic_signals.connect(_dialogic_signals)


func _leave_room() -> void:
	$Door/InteractionManager.scene_transition.disconnect(_leave_room)
	SceneManager.switch_scene(Global.scenes["OUTSIDE"])


# End the preamble dialog
func _end_preamble():
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(_end_preamble)
