extends PanelContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	if Global.mute == true:
		$MarginContainer/VBoxContainer/sound.text = "Sound OFF"
		$MarginContainer/VBoxContainer/sound.button_pressed = true

# Resume game, close options
func resume() -> void:
	hide()
	get_tree().paused = false


# Pause game and open options
func pause():
	get_tree().paused = true
	show()

# Callback for when resume button signals
func _on_resume_pressed() -> void:
	resume()

# Callback for when sound button is toggled
func _on_sound_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.mute = true
		$MarginContainer/VBoxContainer/sound.text = "Sound OFF"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		Global.mute = false
		$MarginContainer/VBoxContainer/sound.text = "Sound ON"
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)

# Callback for when quit button signals
func _on_quit_pressed() -> void:
	SceneManager.switch_scene(Global.scenes["MAIN_MENU"])


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("options") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("options") and get_tree().paused:
		resume()
