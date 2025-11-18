extends Node
var rec_points = 0 #progress toward reconciliation ending
var con_points = 0 #progress toward consumption ending
var has_key = false #whether the protag has the key to the door
var progress = 0 #the number of 'scenes' the player has experienced
var prev_scene
enum State {MOVING, INTERACTING}
var player_state = State.MOVING

const location_path_root = "res://scenes/locations/"
const location_path = {
	"ROOM1": "room1/room1.tscn",
	"ROOM2": "room2/room2.tscn",
	"ROOM3": "room3/room3.tscn",
	"ROOM4": "room4/room4.tscn",
	"ROOM5": "room5/room5.tscn"
}


var debug_mode = false # whether debug mode is on (skips some text, gives keys)
# now onto vital game switches that determine progression!!!

# has the player started the game?
var awaken_first = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
