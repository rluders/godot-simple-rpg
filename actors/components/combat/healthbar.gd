extends ProgressBar


@export var health_component : HealthComponent


func _ready() -> void:
	health_component.health_changed.connect(_on_health_changed)
	max_value = health_component.max_health
	value = health_component.health
	visible = false


func _on_health_changed(_old_health: float, health: float) -> void:
	value = health
	visible = value < max_value
