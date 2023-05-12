extends Actor


@onready var sprite : Sprite2D = $Sprite2D
@onready var detection_area : DetectionArea = $DetectionArea


func _on_health_health_depleted() -> void:
	is_alive = false
	
	# TODO How can I use anim_state here?
	anim_tree.active = false
	anim_player.play("death")
	await anim_player.animation_finished
	queue_free()
