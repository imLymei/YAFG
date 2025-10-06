extends State


@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent


func on_process(_delta: float) -> void:
	if not movement_component.is_on_floor:
		request_state_change.emit(self, "Air")
		return
	
	if input_component.is_jumping:
		request_state_change.emit(self, "Jump")
		return
	
	if input_component.movement_direction == 0:
		request_state_change.emit(self, "Idle")
		return
	
	movement_component.move_to_direction(input_component.movement_direction, 500, 5000)
	movement_component.queue_move_and_slide()
