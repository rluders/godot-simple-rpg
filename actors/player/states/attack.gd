extends State


@export var hitbox_pivot : Marker2D

var is_attacking = false


func _ready() -> void:
	super()
	await ready
	
	actor.anim_tree.animation_finished.connect(_on_animation_finished)


func enter(_msg : Dictionary = {}) -> void:
	is_attacking = true
	actor.anim_state.travel("Attack")


func _on_animation_finished(_anim_name: String) -> void:
	is_attacking = false
	
	var direction : = actor.get_direction()
	if direction != Vector2.ZERO:
		state_machine.change_state("Idle")
		return
	state_machine.change_state("Walk")
