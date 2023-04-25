@tool
class_name DetectionArea
extends Area2D


signal target_found(target: Node2D)
signal target_lost(target: Node2D)

@export var shape : Shape2D


func _get_configuration_warnings() -> PackedStringArray:
	var warnings : = PackedStringArray()
	if not shape:
		warnings.append("A shape must be provided for DetectionArea to function. Please create a shape resource for it!")
	
	return warnings


func _enter_tree() -> void:
	$CollisionShape2D.shape = shape


func _on_body_entered(body: Node2D) -> void:
	target_found.emit(body)


func _on_body_exited(body: Node2D) -> void:
	target_lost.emit(body)
