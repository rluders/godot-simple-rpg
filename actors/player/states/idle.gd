extends State


@export var friction : float = 500.0


func enter(_msg : Dictionary = {}) -> void:
	actor.velocity = Vector2.ZERO
	actor.anim_state.travel("Idle")


func physics_process(delta: float) -> void:
	var direction : = actor.get_direction()
	if direction != Vector2.ZERO:
		state_machine.change_state("Walk")
		return
	
	actor.velocity = actor.velocity.move_toward(Vector2.ZERO, friction * delta)
