extends State

@export var acceleration : float = 250.0
@export var max_speed : float = 40.0
# @export var detection_area : DetectionArea


# @TODO I need to explore it a little bit more
# func _ready() -> void:
	# super() # calls parent _ready()
	
	# detection area is required!
	# assert(detection_area != null)
	# connect the detection signals
	# detection_area.target_found.connect(func(target: Node2D): chase_target = target)
	# detection_area.target_lost.connect(func(_target: Node2D): chase_target = null)


func enter(_msg : Dictionary = {}) -> void:
	actor.anim_state.travel("Walk")


func physics_process(delta: float) -> void:
	var chase_target = actor.detection_area.get_target()
	if not chase_target:
		state_machine.change_state("Idle")
		return
	
	var direction = (chase_target.global_position - actor.global_position).normalized()
	actor.velocity = actor.velocity.move_toward(direction * max_speed, acceleration * delta)
	actor.sprite.flip_h = actor.velocity.x < 0
	
	actor.move_and_slide()
