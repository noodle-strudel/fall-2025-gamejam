extends Node
var rec_points = 0
var con_points = 0
var prev_scene
enum State {MOVING, INTERACTING}
var player_state = State.MOVING

# now onto vital game switches that determine progression!!!

# has the player started the game?
var awaken_first = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
