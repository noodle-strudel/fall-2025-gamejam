extends Node2D

@onready var boundary_left = $Base.boundary_left
@onready var boundary_right = $Base.boundary_right
@onready var boundary_top = $Base.boundary_top
@onready var boundary_bottom = $Base.boundary_bottom
#@onready var vignette = $CanvasLayer/Vignette/AnimationPlayer

func _ready() -> void:
	#set_camera_limits()
	# First time awakening
	if Global.awaken_first == false:
		Global.player_state = Global.State.INTERACTING
		Dialogic.start("beginning")
		Dialogic.timeline_ended.connect(end_beginning_dialog)
		Dialogic.signal_event.connect(dialogic_signals)
	# If you've already awaken
	else:
		Global.is_inside = false
		Global.player_state = Global.State.MOVING
		$TransitionEffects.lift_all()
		# No need to obscure everything
		#$TransitionEffects/BlackButPlayer.color = Color.TRANSPARENT
		#$TransitionEffects/CanvasLayer/Vignette.color = Color.TRANSPARENT
	
	# Connect to door scene transition signals
	$Door/InteractionManager.fade_out.connect(fade_out)
	$Door/InteractionManager.scene_transition.connect(scene_transition)


# Called when door interaction emits "scene_transition" signal
# Transitions to scene depending on current game progress
func scene_transition() -> void:
	var room
	match Global.progress:
		0: room = "ROOM1"
		1: room = "ROOM2"
		2: room = "ROOM3"
		3: room = "ROOM4"
		4: room = "ROOM5"
	$Door/InteractionManager.scene_transition.disconnect(scene_transition)
	Global.is_inside = true
	SceneManager.switch_scene(Global.scenes[room])


func fade_out() -> void:
	print_debug("Fade out function")
	$TransitionEffects.scene_transition_anim.play("Fade")
	$Door/InteractionManager.fade_out.disconnect(fade_out)
	

func set_camera_limits():
	$Player/Camera2D.limit_left = boundary_left
	$Player/Camera2D.limit_right = boundary_right
	$Player/Camera2D.limit_top = boundary_top
	$Player/Camera2D.limit_bottom = boundary_bottom


func dialogic_signals(arg) -> void:
	if arg is String:
		if arg == "player_fade_in":
			#$SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
			$TransitionEffects.scene_transition_anim.play_backwards("Fade")
		if arg == "background_fade_in":
			#$BlackButPlayer/AnimationPlayer.play("fade_out")
			$TransitionEffects.black_but_player_anim.play("fade_out")
		if arg == "vignette_fade_out":
			#vignette.play("fade_out")
			$TransitionEffects.vignette_anim.play("fade_out")
		if arg == "vignette_fade_in":
			#vignette.play_backwards("fade_out")
			$TransitionEffects.vignette_anim.play_backwards("fade_out")
	else: # arg is dictionary
		var functions = arg.keys()
		for key in functions:
			if key.ends_with("_sfx"):
				SoundEffects.play_count(key.trim_suffix("_sfx"), arg[key])


func end_beginning_dialog():
	if Global.awaken_first == false:
		Global.awaken_first = true
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_beginning_dialog)
	Dialogic.signal_event.disconnect(dialogic_signals)
