@icon("res://scenes/components/level_portal.png")
class_name LevelPortal
extends Area2D


@export var destination : String
@export var spawn_point : Marker2D


func _ready() -> void:
	LevelManager.level_changed.connect(_on_level_changed)


func travel_to_destination() -> void:
	LevelManager.change_level(destination)


func _on_level_changed(old_level: String, _new_level: String) -> void:
	if old_level != destination:
		return
	
	# spawn player
	var player = LevelManager.current_player
	player.position = spawn_point.global_position
	get_parent().add_child(player)


func _on_body_entered(_body: Node2D) -> void:
	travel_to_destination()
