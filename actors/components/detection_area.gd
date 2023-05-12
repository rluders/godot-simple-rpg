class_name DetectionArea
extends Area2D


signal target_found(target: Node2D)
signal target_lost(target: Node2D)

var target : Node2D


func _on_body_entered(body: Node2D) -> void:
	target = body
	target_found.emit(body)


func _on_body_exited(body: Node2D) -> void:
	target = null
	target_lost.emit(body)


func has_target() -> bool:
	return target != null


func get_target() -> Node2D:
	return target
