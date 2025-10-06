class_name StateMachine
extends Node


@export var initial_state: State


var states: Dictionary[String, State]
var current_state: State :
	set(new_value):
		if current_state:
			current_state.on_exit()
		
		@warning_ignore("incompatible_ternary")
		print("%s -> %s" % [current_state.name if current_state else "NULL", new_value.name if new_value else "NULL"])
		current_state = new_value
		
		if current_state:
			current_state.on_enter()


func _ready() -> void:
	current_state = initial_state
	
	for child: State in get_children():
		if child is not State:
			continue
		
		states.set(child.name, child)
		child.request_state_change.connect(_on_request_state_change)


func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)


func _process(delta: float) -> void:
	if current_state:
		current_state.on_process(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.on_physics_process(delta)


func _on_request_state_change(caller: State, new_state_name: String) -> void:
	if caller != current_state:
		return
	
	var new_state: State = states.get(new_state_name)
	
	if not new_state:
		return
	
	current_state = new_state
