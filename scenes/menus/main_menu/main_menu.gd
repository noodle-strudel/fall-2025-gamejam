extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_button_play_pressed() -> void:
	SceneManager.switch_scene(Global.scenes["OUTSIDE"])


func _on_debug_mode_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.debug_mode = true
		$MarginContainer/VBoxContainer/DebugMode.text = "Debug Mode ON"
	else:
		Global.debug_mode = false
		$MarginContainer/VBoxContainer/DebugMode.text = "Debug Mode OFF"


func _on_sound_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$MarginContainer/VBoxContainer/Sound.text = "Sound OFF"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		$MarginContainer/VBoxContainer/Sound.text = "Sound ON"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
