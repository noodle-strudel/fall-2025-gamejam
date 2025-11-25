class_name Room extends Level

func _ready() -> void: 
	super._ready()
	lift_all_effects()
	Global.been_inside = true
	#$TransitionEffects/Vignette.hide()
	#$TransitionEffects/BlackButPlayer.hide()
	#$TransitionEffects/SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
	Global.player_state = Global.State.MOVING
	$Door/InteractionManager.scene_transition.connect(_leave_room)


func _leave_room() -> void:
	$Door/InteractionManager.scene_transition.disconnect(_leave_room)
	SceneManager.switch_scene(Global.scenes["OUTSIDE"])


#func fade_out() -> void:
	#print_debug("Fade out function")
	#$TransitionEffects.scene_transition_anim.play("Fade")
	#$Door/InteractionManager.fade_out.disconnect(fade_out)
