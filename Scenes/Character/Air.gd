extends State


@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var coyote_timer: Timer = %CoyoteTimer


func on_enter() -> void:
	coyote_timer.start()


func on_process(_delta: float) -> void:
	if input_component.is_jumping and not coyote_timer.is_stopped():
		request_state_change.emit(self, "Jump")
		return
	
	if movement_component.is_on_floor:
		request_state_change.emit(self, "Moving" if input_component.movement_direction != 0 else "Idle")
		return
	
	movement_component.move_to_direction(input_component.movement_direction, 1000, 5000)
	movement_component.apply_gravity()
	movement_component.queue_move_and_slide()
