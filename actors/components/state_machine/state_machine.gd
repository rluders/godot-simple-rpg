@icon("res://actors/components/state_machine/state_machine.png")
class_name StateMachine
extends Node


signal state_changed(state_name: String)

@export var initial_state : State

@onready var current_state : State = initial_state


func _ready() -> void:
	await ready
	
	for child in get_children():
		child.state_machine = self
	
	current_state.enter()


func _process(delta: float) -> void:
	current_state.process(delta)


func _physics_process(delta: float) -> void:
	current_state.physics_process(delta)

func _unhandled_input(event: InputEvent) -> void:
	current_state.input(event)


func change_state(new_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(new_state_name):
		return
	
	current_state.exit()
	current_state = get_node(new_state_name)
	current_state.enter(msg)
	
	state_changed.emit(current_state.name)
