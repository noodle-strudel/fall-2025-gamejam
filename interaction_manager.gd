extends Area2D

class_name InteractionManager

var current_interaction: InteractionManager

func initiate_interaction() -> void:
	if current_interaction != null:
		current_interaction.receive_interaction()

func receive_interaction() -> void:
	print("No interaction reception behavior defined.")


func _on_Interaction_Manager_area_entered(area):
	current_interaction = area


func _on_Interaction_Manager_area_exited(area):
	if current_interaction == area:
		current_interaction = null

func start_interaction(t) -> void:
	Dialogic.timeline_ended.connect(end_interaction)
	var dialog = Dialogic.start(t)
	add_child(dialog)
	$CollisionShape2D.disabled = true

func end_interaction(timeline_name):
	$CollisionShape2D.disabled = false
	Dialogic.timeline_ended.disconnect(end_interaction)
