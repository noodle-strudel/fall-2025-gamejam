extends Node

@onready var boundary_left = $Base.boundary_left
@onready var boundary_right = $Base.boundary_right
@onready var boundary_top = $Base.boundary_top
@onready var boundary_bottom = $Base.boundary_bottom
@onready var vignette = $CanvasLayer/Vignette/AnimationPlayer

func _ready() -> void:
	# First time awakening
	if Global.awaken_first == false:
		
		Global.player_state = Global.State.INTERACTING
		Dialogic.start("beginning")
		Dialogic.timeline_ended.connect(end_beginning_dialog)
		Dialogic.signal_event.connect(dialogic_signals)
		set_camera_limits()
	# If you've already awaken
	else:
		# No need to obscure everything
		$BlackButPlayer.color = Color.TRANSPARENT
	
	
func set_camera_limits():
	$Player/Camera2D.limit_left = boundary_left
	$Player/Camera2D.limit_right = boundary_right
	$Player/Camera2D.limit_top = boundary_top
	$Player/Camera2D.limit_bottom = boundary_bottom

func _physics_process(delta: float) -> void:
	pass

func dialogic_signals(arg) -> void:
	if arg is String:
		if arg == "player_fade_in":
			$SceneTransitionRect/AnimationPlayer.play_backwards("Fade")
		if arg == "background_fade_in":
			$BlackButPlayer/AnimationPlayer.play("fade_out")
		if arg == "vignette_fade_out":
			vignette.play("fade_out")
		if arg == "vignette_fade_in":
			vignette.play_backwards("fade_out")
	else: # arg is dictionary
		var functions = arg.keys()
		if functions[0] == "drip_sfx":
			SoundEffects.drip_sfx(arg["drip_sfx"])
	
func end_beginning_dialog():
	if Global.awaken_first == false:
		Global.awaken_first = true
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_beginning_dialog)
	Dialogic.signal_event.disconnect(dialogic_signals)
