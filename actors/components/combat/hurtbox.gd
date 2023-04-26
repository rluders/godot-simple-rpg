@icon("res://actors/components/combat/hurtbox.png")
class_name Hurtbox
extends Area2D
# Hurtbox is part of an actor's body that can be damaged when it touch a Hitbox.

signal damage_received(amount: float)

var is_invincible = false :
	set(value):
		is_invincible = value

@export var invincible_time : float = 0.25
@export var health_component : HealthComponent

var invicible_timer : Timer = Timer.new()


func _ready() -> void:
	invicible_timer.one_shot = true
	add_child(invicible_timer)


func get_hurt(hit: HitResource) -> void:
	if is_invincible:
		return
	if not invicible_timer.is_stopped():
		return
	
	invicible_timer.start(invincible_time)
	
	if health_component:
		health_component.damage(hit.damage)
	
	disable()
	damage_received.emit(hit.damage)


func disable() -> void:
	set_collision_disabled(true)


func enable() -> void:
	set_collision_disabled(false)


func set_collision_disabled(value: bool) -> void:
	for child in get_children():
		if not child is CollisionShape2D or not child is CollisionPolygon2D:
			continue
		child.disabled = value


func _on_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	var hit = area.hit
	if not is_in_group(hit.team):
		get_hurt(hit)
