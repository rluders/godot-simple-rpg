class_name Actor
extends CharacterBody2D

# Movement
@export var acceleration : float = 500.0
@export var max_speed : float = 80.0
@export var friction : float = 500.0

# Animation
@export var anim_player : AnimationPlayer
@export var anim_tree : AnimationTree

@onready var anim_state : AnimationNodeStateMachinePlayback = anim_tree.get("parameters/playback")

var is_alive : bool = true


func get_direction() -> Vector2:
	return Vector2.ZERO
