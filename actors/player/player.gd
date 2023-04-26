class_name Player
extends Actor


@onready var sprite : Sprite2D = $Sprite2D
@onready var hitbox_pivot : Marker2D = $HitboxPivot

var is_attacking = false


func _ready() -> void:
	anim_tree.active = true


func _physics_process(delta: float) -> void:
	if not is_alive:
		return
	if is_attacking:
		return
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := get_direction()
	
	if direction != Vector2.ZERO:
		anim_state.travel("Walk")
		# AnimationTree for movement
		anim_tree.set("parameters/Idle/blend_position", velocity)
		anim_tree.set("parameters/Walk/blend_position", velocity)
		anim_tree.set("parameters/Attack/blend_position", velocity)
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		anim_state.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		attack()


func attack() -> void:
	is_attacking = true
	anim_state.travel("Attack")


func get_direction() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")


func _on_health_health_depleted() -> void:
	is_alive = false
	# TODO How can I use anim_state here?
	anim_tree.active = false
	anim_player.play("death")
	await anim_player.animation_finished
	queue_free()
