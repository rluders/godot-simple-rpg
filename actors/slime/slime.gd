extends Actor


var chase_target : Node2D

@onready var sprite : Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	if chase_target:
		anim_state.travel("Walk")
		var direction : = (chase_target.global_position - global_position).normalized()
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
		sprite.flip_h = velocity.x < 0
	else:
		anim_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()


func _on_detection_area_target_found(target: Node2D) -> void:
	chase_target = target


func _on_detection_area_target_lost(_target: Node2D) -> void:
	chase_target = null
