class_name Room extends Level

func _ready() -> void: 
	super._ready()
	lift_all_effects()
	Global.been_inside = true
	Global.player_state = Global.State.MOVING
	$Door/InteractionManager.scene_transition.connect(_leave_room)
	$Door/InteractionManager.dialogic_signals.connect(_dialogic_signals)


func _leave_room() -> void:
	$Door/InteractionManager.scene_transition.disconnect(_leave_room)
	SceneManager.switch_scene(Global.scenes["OUTSIDE"])
