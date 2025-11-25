extends Node

# Player state variables
enum State {MOVING, INTERACTING, SITTING}
var player_state = State.MOVING
var is_inside = false

# Options variables
var mute = false
# whether debug mode is on (skips some text, gives keys)
var debug_mode = false

# Scene variables
var prev_scene
const scenes = {
	"MAIN_MENU": "res://scenes/menus/main_menu/main_menu.tscn",
	"OPTIONS_MENU": "res://scenes/menus/options/options_menu.tscn",
	"OUTSIDE": "res://scenes/levels/outside/outside.tscn",
	# PLACEHOLDER all point to room 1
	"ROOM1": "res://scenes/levels/rooms/room1.tscn",
	"ROOM2": "res://scenes/levels/rooms/room2.tscn",
	"ROOM3": "res://scenes/levels/rooms/room3.tscn",
	"ROOM4": "res://scenes/levels/rooms/room4.tscn",
	"ROOM5": "res://scenes/levels/rooms/room5.tscn"
}

# Player progress variables

# has the player started the game?
var awaken_first: bool = false

# the number of 'scenes' the player has experienced
# incremented at the end of statue dialogue
var progress: int = 1

# whether the player has interacted with the event
# set to true at end of event interaction, reset to false after statue dialogue
var has_interacted: bool = false

# whether the player has got the key from the statue
# set to true after statue dialogue
# reset to false when player completes event interaction
var has_key: bool = false

# whether the player has been inside for this run
# set to true when player enters house for the first time after getting key (in dialogic timeline "outside_door_unlock")
# reset to false at end of statue dialogue
var been_inside: bool = false

# progress toward reconciliation ending
var reconciliation: int = 0
# progress toward consumption ending
var consumption: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
