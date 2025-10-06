class_name State
extends Node


signal request_state_change(caller: State, new_state: String)


func on_enter() -> void:
	pass


func on_exit() -> void:
	pass


func on_input(_event: InputEvent) -> void:
	pass


func on_process(_delta: float) -> void:
	pass


func on_physics_process(_delta: float) -> void:
	pass
