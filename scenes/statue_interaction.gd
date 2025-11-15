extends InteractionManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	pass # Replace with function body.

func receive_interaction() -> void:
	#print("No interaction reception behavior defined.")
	start_interaction("statue1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dialogic_signal(argument: String) -> void:
	pass
