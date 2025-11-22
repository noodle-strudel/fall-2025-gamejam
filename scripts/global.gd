extends Node
var prev_scene
enum State {MOVING, INTERACTING, SITTING}
var player_state = State.MOVING
var is_inside = false
var mute = false

const scenes = {
	"MAIN_MENU": "res://scenes/menus/main_menu/main_menu.tscn",
	"OPTIONS_MENU": "res://scenes/menus/options/options_menu.tscn",
	"OUTSIDE": "res://scenes/levels/outside/outside.tscn",
	# PLACEHOLDER all point to room 1
	"ROOM1": "res://scenes/levels/room1/room1.tscn",
	"ROOM2": "res://scenes/levels/room1/room1.tscn",
	"ROOM3": "res://scenes/levels/room1/room1.tscn",
	"ROOM4": "res://scenes/levels/room1/room1.tscn",
	"ROOM5": "res://scenes/levels/room1/room1.tscn"
	#"ROOM2": "res://scenes/levels/room2/room2.tscn",
	#"ROOM3": "res://scenes/levels/room3/room3.tscn",
	#"ROOM4": "res://scenes/levels/room4/room4.tscn",
	#"ROOM5": "res://scenes/levels/room5/room5.tscn"
}

var debug_mode = false # whether debug mode is on (skips some text, gives keys)

# now onto vital game switches that determine progression!!!
# has the player started the game?
var awaken_first = false
# the number of 'scenes' the player has experienced
var progress: int = 0
# whether the protag has the key to the door
#var has_key = false 
# progress toward reconciliation ending
var rec_points = 0 
# progress toward consumption ending
var con_points = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
