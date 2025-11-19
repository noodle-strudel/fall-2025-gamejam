extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	$TransitionEffects.lift_all()
	Global.player_state = Global.State.MOVING
	$Door/InteractionManager.fade_out.connect(fade_out)
	$Door/InteractionManager.scene_transition.connect(scene_transition)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fade_out() -> void:
	print_debug("Fade out function")
	$TransitionEffects.scene_transition_anim.play("Fade")
	$Door/InteractionManager.fade_out.disconnect(fade_out)


func scene_transition() -> void:
	$Door/InteractionManager.scene_transition.disconnect(scene_transition)
	SceneManager.switch_scene(Global.scenes["OUTSIDE"])
