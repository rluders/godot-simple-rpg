class_name Player
extends Actor


@onready var sprite : Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := get_direction()
	
	if direction != Vector2.ZERO:
		sprite.flip_h = direction.x < 0
		anim_state.travel("Walk")
		# AnimationTree for movement
		anim_tree.set("parameters/Idle/blend_position", velocity)
		anim_tree.set("parameters/Walk/blend_position", velocity)
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		anim_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()


func get_direction() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
