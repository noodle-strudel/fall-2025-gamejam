extends Node
var prev_scene
enum State {MOVING, INTERACTING}
var player_state = State.MOVING

const scenes = {
	"MAIN_MENU": "res://scenes/menus/main_menu/main_menu.tscn",
	"OPTIONS_MENU": "res://scenes/menus/options/options_menu.tscn",
	"OUTSIDE": "res://scenes/outside/outside.tscn",
	"ROOM1": "res://scenes/rooms/room1/room1.tscn",
	"ROOM2": "res://scenes/rooms/room2/room2.tscn",
	"ROOM3": "res://scenes/rooms/room3/room3.tscn",
	"ROOM4": "res://scenes/rooms/room4/room4.tscn",
	"ROOM5": "res://scenes/rooms/room5/room5.tscn"
}

var debug_mode = false # whether debug mode is on (skips some text, gives keys)

# now onto vital game switches that determine progression!!!
# has the player started the game?
var awaken_first = false
# the number of 'scenes' the player has experienced
var progress = 0 
# whether the protag has the key to the door
var has_key = false 
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
