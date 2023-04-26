@icon("res://actors/components/status/health.png")
class_name HealthComponent
extends Node


signal health_changed(old_amount: float, new_amount: float)
signal health_depleted

var health : float = 100

@export var max_health : float = 100


func _ready() -> void:
	health = max_health


func damage(amount: float) -> void:
	var old_health = health
	health = clamp(health - amount, 0, max_health)
	health_changed.emit(old_health, health)
	if health <= 0:
		health_depleted.emit()


func heal(amount: float):
	var old_health = health
	health = clamp(health + amount, 0, max_health)
	health_changed.emit(old_health, health)
