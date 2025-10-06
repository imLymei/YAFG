class_name DebugLabel
extends Label


@export var target: Node
@export var parameter_path: StringName


func _process(_delta: float) -> void:
	var value = target.get(parameter_path)
	
	if value == null:
		text = "Property Undefined"
	else:
		text = str(value)
