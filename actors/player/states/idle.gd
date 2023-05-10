extends State


func enter(_msg : Dictionary = {}) -> void:
	actor.velocity = Vector2.ZERO


func physics_process(delta: float) -> void:
	var direction : = actor.get_direction()
	if direction != Vector2.ZERO:
		state_machine.change_state("Walk")
		return
	
	actor.anim_state.travel("Idle")
	actor.velocity = actor.velocity.move_toward(Vector2.ZERO, actor.friction * delta)
