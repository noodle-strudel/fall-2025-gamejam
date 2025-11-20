extends Node

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
		Global.mute = true
		$MarginContainer/VBoxContainer/Sound.text = "Sound OFF"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		Global.mute = false
		$MarginContainer/VBoxContainer/Sound.text = "Sound ON"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
