extends PanelContainer

func _ready() -> void:
	hide()
	if Global.mute == true:
		$MarginContainer/VBoxContainer/sound.text = "Sound OFF"
		$MarginContainer/VBoxContainer/sound.button_pressed = true


func resume() -> void:
	hide()
	get_tree().paused = false

func pause():
	get_tree().paused = true
	show()

func on_esc_pressed() -> void:
	if Input.is_action_just_pressed("options") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("options") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_sound_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.mute = true
		$MarginContainer/VBoxContainer/sound.text = "Sound OFF"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		Global.mute = false
		$MarginContainer/VBoxContainer/sound.text = "Sound ON"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)


func _on_quit_pressed() -> void:
	get_tree().quit()

func _process(delta: float) -> void:
	on_esc_pressed()
