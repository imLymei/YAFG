class_name MovementComponent
extends Node


const GRAVITY_FORCE: float = 9600.0


@export var target: CharacterBody2D


var _should_move_and_slide := false
var _new_velocity: Vector2


var is_on_floor := false
var is_moving := true


func _ready() -> void:
	_update_target_state()
	_new_velocity = target.velocity
	process_priority = 1


func _process(_delta: float) -> void:
	_update_target_state()
	
	if _should_move_and_slide:
		_should_move_and_slide = false
		target.velocity = _new_velocity
		target.move_and_slide()
		is_moving = not is_zero_approx(target.velocity.x)


func move_to_direction(direction: float, speed: float, acceleration: float = 0) -> void:
	if acceleration == 0:
		_new_velocity.x = speed * direction
	else:
		_new_velocity.x = move_toward(
			target.velocity.x,
			speed * direction,
			acceleration * get_process_delta_time()
		)


func stop(acceleration: float = 0) -> void:
	if acceleration == 0:
		_new_velocity.x = 0
	else:
		_new_velocity.x = move_toward(
			target.velocity.x,
			0,
			acceleration * get_process_delta_time()
		)


func jump(force: float) -> void:
	_new_velocity.y = -force


func apply_gravity(direction: float = 1) -> void:
	_new_velocity.y = target.velocity.y + direction * GRAVITY_FORCE * get_process_delta_time()


func queue_move_and_slide() -> void:
	_should_move_and_slide = true


func _update_target_state() -> void:
	is_on_floor = target.is_on_floor()
