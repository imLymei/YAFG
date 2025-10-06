extends State


@onready var movement_component: MovementComponent = %MovementComponent


func on_enter() -> void:
	movement_component.jump(1000)
	movement_component.queue_move_and_slide()
	
	request_state_change.emit(self, "Air")
