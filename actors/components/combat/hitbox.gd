class_name Hitbox
extends Area2D


signal hit_started
signal hit_finished
signal hit_landed
signal hit_missed

@export var hit : HitResource

var _is_hit_landed = false
var _active = false


func enable() -> void:
	_is_hit_landed = false
	hit_started.emit()
	set_shape_disabled(false)
	_active = true


func disable() -> void:
	if not _is_hit_landed:
		hit_missed.emit()
	set_shape_disabled(true)
	_active = false


func set_shape_disabled(value: bool) -> void:
	for shape in get_children():
		shape.call_deferred("set_disabled", value)


func _on_area_entered(area: Area2D) -> void:
	if not area.has_method("get_hurt"):
		return
	
	if  not area.is_in_group(hit.team) and not area.is_invincible:
		hit_landed.emit()
