@icon("res://actors/components/state_machine/state.png")
class_name State
extends Node

var state_machine : StateMachine
var actor : Actor


func _ready() -> void:
	await ready
	
	actor = owner as Actor
	assert(actor != null)


func input(_event: InputEvent) -> void:
	pass


func process(_delta: float) -> void:
	pass


func physics_process(_delta: float) -> void:
	pass


func enter(_msg : Dictionary = {}) -> void:
	pass


func exit() -> void:
	pass
