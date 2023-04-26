extends AnimationPlayer


@onready var player : = get_parent()


func attack_animation_finished() -> void:
	player.is_attacking = false
	
