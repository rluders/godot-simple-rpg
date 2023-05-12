class_name Actor
extends CharacterBody2D


# Animation
@export var anim_player : AnimationPlayer
@export var anim_tree : AnimationTree
@onready var anim_state : AnimationNodeStateMachinePlayback = anim_tree.get("parameters/playback")

var is_alive : bool = true


func get_direction() -> Vector2:
	return Vector2.ZERO
