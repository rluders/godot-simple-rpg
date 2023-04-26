@icon("res://actors/components/combat/hitbox.png")
class_name Hitbox
extends Area2D
# Hitbox is part of an attack that can damage an actor when it touch their Hurtbox.

signal hit_landed

@export var hit : HitResource

var _active : bool = false


func enable() -> void:
	set_shape_disabled(false)
	_active = true


func disable() -> void:
	set_shape_disabled(true)
	_active = false


func set_shape_disabled(value: bool) -> void:
	for shape in get_children():
		shape.call_deferred("set_disabled", value)


func _on_area_entered(area: Area2D) -> void:
	if not _active:
		return
	if not area.has_method("get_hurt"):
		return
	
	if  not area.is_in_group(hit.team) and not area.is_invincible:
		hit_landed.emit()
