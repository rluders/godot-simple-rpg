extends State

# TODO Move max_speed and acceleration to here

func physics_process(delta: float) -> void:
	var direction : = actor.get_direction()
	
	if direction == Vector2.ZERO:
		state_machine.change_state("Idle")
		return
	
	# Change animation
	actor.anim_state.travel("Walk")
	# Update AnimationTree parameters - @TODO Review it
	actor.anim_tree.set("parameters/Idle/blend_position", actor.velocity)
	actor.anim_tree.set("parameters/Walk/blend_position", actor.velocity)
	actor.anim_tree.set("parameters/Attack/blend_position", actor.velocity)
	# Calculate velocity
	actor.velocity = actor.velocity.move_toward(direction * actor.max_speed, actor.acceleration * delta)
	
	actor.move_and_slide()
