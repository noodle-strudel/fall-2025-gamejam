extends Node

var current_scene = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(get_child_count() - 1)
	print_debug(root)
	print_debug(current_scene)
	

func switch_scene(res_path: String) -> void:
	call_deferred("_deferred_switch_scene", res_path)

func _deferred_switch_scene(res_path: String) -> void:
	current_scene.free()
	var scene = load(res_path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
