@tool
@icon("res://actors/components/combat/damage_indicator.png")
class_name DamageIndicator
extends Marker2D


@export var damage_text : PackedScene
@export var hurtbox : Hurtbox


func _ready() -> void:
	if hurtbox:
		hurtbox.damage_received.connect(_on_hurtbox_damage_received)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings : = PackedStringArray()
	if not damage_text:
		warnings.append("Missing DamageIndicatorText.")
	if not hurtbox:
		warnings.append("Missing Hurtbox.")
	return warnings


func _on_hurtbox_damage_received(amount: float) -> void:
	var indicator : = damage_text.instantiate()
	indicator.amount = amount
	indicator.global_position = global_position
	get_tree().root.add_child(indicator)
