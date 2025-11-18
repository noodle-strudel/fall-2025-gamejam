extends PanelContainer


func resume() -> void:
	hide()
	get_tree().paused = false

func pause():
	get_tree().paused = true
	show()

func _on_esc_pressed() -> void:
	if Input.is_action_just_pressed("options") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("options") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_sound_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
