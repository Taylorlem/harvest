extends Node2D
@onready var panel =  $"../../CanvasLayer/Panel"
@onready var interact_label: Label = $InteractLabel
var currentinteractions := []
var can_interact = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_interact:
		if currentinteractions:
			can_interact = false
			interact_label.hide()
			await currentinteractions[0].interact.call()
			can_interact = true

func _process(delta: float) -> void:
	if currentinteractions and can_interact:
		currentinteractions.sort_custom(_sort_by_nearest)
		if currentinteractions[0].is_interactable:
			interact_label.text = currentinteractions[0].interact_name
			panel.show_dialogue("yippe")
		else:
			interact_label.hide()
		
func _sort_by_nearest(area1, area2):
	var area1_dist = global_position.distance_to(area1.global_position)
	var area2_dist = global_position.distance_to(area2.global_position)
	return area1_dist < area2_dist

func _on_interact_range_area_entered(area: Area2D) -> void:
	currentinteractions.push_back(area)

func _on_interact_range_area_exited(area: Area2D) -> void:
	currentinteractions.erase(area)
