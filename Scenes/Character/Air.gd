extends State


@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent


func on_input(_event: InputEvent) -> void:
	pass


func on_process(_delta: float) -> void:
	if movement_component.is_on_floor:
		request_state_change.emit(self, "Moving" if input_component.movement_direction != 0 else "Idle")
		return
	
	movement_component.move_to_direction(input_component.movement_direction, 500, 1000)
	movement_component.apply_gravity()
	movement_component.queue_move_and_slide()


func on_physics_process(_delta: float) -> void:
	pass
