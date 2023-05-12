extends State


@export var acceleration : float = 500.0
@export var max_speed : float = 80.0


func enter(_msg : Dictionary = {}) -> void:
	actor.anim_state.travel("Walk")


func physics_process(delta: float) -> void:
	var direction : = actor.get_direction()
	
	if direction == Vector2.ZERO:
		state_machine.change_state("Idle")
		return
	
	# Update AnimationTree parameters - @TODO Review it
	actor.anim_tree.set("parameters/Idle/blend_position", actor.velocity)
	actor.anim_tree.set("parameters/Walk/blend_position", actor.velocity)
	actor.anim_tree.set("parameters/Attack/blend_position", actor.velocity)
	
	# Calculate velocity
	actor.velocity = actor.velocity.move_toward(direction * max_speed, acceleration * delta)
	
	actor.move_and_slide()
