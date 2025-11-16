extends Node

@onready var boundary_left = $Base.boundary_left
@onready var boundary_right = $Base.boundary_right
@onready var boundary_top = $Base.boundary_top
@onready var boundary_bottom = $Base.boundary_bottom
@onready var vignette = $CanvasLayer/Vignette/AnimationPlayer

func _ready() -> void:
	Global.player_state = Global.State.INTERACTING
	Dialogic.start("beginning")
	Dialogic.timeline_ended.connect(end_beginning_dialog)
	Dialogic.signal_event.connect(dialogic_signals)
	set_camera_limits()
	
func set_camera_limits():
	$Player/Camera2D.limit_left = boundary_left
	$Player/Camera2D.limit_right = boundary_right
	$Player/Camera2D.limit_top = boundary_top
	$Player/Camera2D.limit_bottom = boundary_bottom

func _physics_process(delta: float) -> void:
	pass

func dialogic_signals(arg: String) -> void:
	if arg == "vignette_fade_out":
		vignette.play("fade_out")
	if arg == "vignette_fade_in":
		vignette.play_backwards("fade_out")
	
func end_beginning_dialog():
	Global.player_state = Global.State.MOVING
	Dialogic.timeline_ended.disconnect(end_beginning_dialog)
	Dialogic.signal_event.disconnect(dialogic_signals)
