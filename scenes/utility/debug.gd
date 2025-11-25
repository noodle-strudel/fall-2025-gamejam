extends PanelContainer

const debug_txt = """progress = {0}
is_inside = {1}
been_inside = {2}
awaken_first = {3}
has_key = {4}
has_interacted = {5}
reconciliation = {6}
consumption = {7}
"""

func _ready() -> void:
	if Global.debug_mode:
		show()


func _process(delta: float) -> void:
	var values = [
		str(Global.progress), 
		str(Global.is_inside), 
		str(Global.been_inside), 
		str(Global.awaken_first), 
		str(Global.has_key), 
		str(Global.has_interacted), 
		int(Global.reconciliation), 
		int(Global.consumption)
	]
	$MarginContainer/Label.text = debug_txt.format(values)
