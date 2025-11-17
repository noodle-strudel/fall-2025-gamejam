extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func drip_sfx(count: int) -> void:
	for i in range(count):
		$Drip.play()
		await get_tree().create_timer(1.0).timeout
