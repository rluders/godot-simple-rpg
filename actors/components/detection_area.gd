class_name DetectionArea
extends Area2D


signal target_found(target: Node2D)
signal target_lost(target: Node2D)


func _on_body_entered(body: Node2D) -> void:
	target_found.emit(body)


func _on_body_exited(body: Node2D) -> void:
	target_lost.emit(body)
