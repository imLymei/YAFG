class_name InputComponent
extends Node


var _jump_buffer_timer: Timer


var movement_direction: float = 0.0
var is_jumping := false


func _ready() -> void:
	_jump_buffer_timer = Timer.new()
	_jump_buffer_timer.wait_time = 0.1
	_jump_buffer_timer.autostart = false
	_jump_buffer_timer.one_shot = true
	
	add_child(_jump_buffer_timer)
	
	process_priority = -1


func _process(_delta: float) -> void:
	movement_direction = Input.get_axis("move_left", "move_right")
	
	var just_pressed_jump_input := Input.is_action_just_pressed("jump")
	if just_pressed_jump_input:
		_jump_buffer_timer.start()
	
	is_jumping = just_pressed_jump_input or not _jump_buffer_timer.is_stopped()


func consume_jump_buffer() -> void:
	_jump_buffer_timer.stop()
