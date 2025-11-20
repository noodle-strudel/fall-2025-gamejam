extends PanelContainer

func _ready() -> void:
	if Global.debug_mode:
		show()


func _process(delta: float) -> void:
	$MarginContainer/GridContainer/progress.text = str(Global.progress)
	$MarginContainer/GridContainer/mute.text = str(Global.mute)
	$MarginContainer/GridContainer/is_inside.text = str(Global.is_inside)
	$MarginContainer/GridContainer/has_key.text = str(Dialogic.VAR.has_key)
	$MarginContainer/GridContainer/has_interacted.text = str(Dialogic.VAR.has_interacted)
	$MarginContainer/GridContainer/consumption.text = str(Dialogic.VAR.consumption)
	$MarginContainer/GridContainer/reconciliation.text = str(Dialogic.VAR.reconciliation)
