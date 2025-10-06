class_name InputComponent
extends Node


var movement_direction: float = 0.0
var is_jumping := false


func _unhandled_input(event: InputEvent) -> void:
	if event is not InputEventKey:
		return
	
	movement_direction = Input.get_axis("move_left", "move_right")
	is_jumping = Input.is_action_pressed("jump")
