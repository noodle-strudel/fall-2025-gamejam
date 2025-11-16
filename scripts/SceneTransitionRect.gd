extends ColorRect

# Path to the next scene to transition to
@export_file("*.tscn") var next_scene_path

# Reference to the _AnimationPlayer_ node
@onready var _anim_player := $AnimationPlayer

func _ready():
	if Global.awaken_first == true:
		_anim_player.play_backwards("Fade")

func transition_to(_next_scene = next_scene_path) -> void:
	# Plays the Fade animation and wait until it finishes

	# if you're not in the main menu, make the previous scene the current scene
	if get_parent().name != "main_menu":
		Global.prev_scene = get_tree().get_current_scene().get_name()
	
	_anim_player.play("Fade")
	await _anim_player.animation_finished
	# Changes the scene
	get_tree().change_scene_to_file(_next_scene)
