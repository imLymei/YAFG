extends State


@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent


func on_enter() -> void:
	input_component.consume_jump_buffer()
	
	movement_component.jump(2000)
	movement_component.queue_move_and_slide()
	
	request_state_change.emit(self, "Air")
