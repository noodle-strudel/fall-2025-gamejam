extends Area2D

# Not working :')
func _ready() -> void:
	$CanvasLayer/ColorRect.material.set_shader_parameter("color", Color("transparent"))


func _on_body_entered(body: Node2D) -> void:
	$CanvasLayer/ColorRect/AnimationPlayer.play_backwards("fade_out")


func _on_body_exited(body: Node2D) -> void:
	$CanvasLayer/ColorRect/AnimationPlayer.play("fade_out")
