extends Node

signal level_changed(old_level: String, new_level: String)

@onready var game : Node = get_tree().root.get_node("Game")

var level_root : Node2D
var current_level : Node2D


func _ready() -> void:
	level_root = game.find_child("LevelRoot")
	assert(level_root)
	current_level = level_root.get_child(0)
	assert(current_level)


func change_level(next_level_path: String) -> void:
	set_process(false)
	var next_level_res = load(next_level_path)
	var next_level = next_level_res.instantiate()
	
	var player = game.get_node("World/Player")
	
	# add the player to the next level
	var portals = next_level.find_child("Portals")
	for portal in portals.get_children():
		if portal.destination == current_level.scene_file_path:
			player.position = portal.spawn_point.global_position
			break
	
	# remove previous level
	current_level.queue_free()
	
	# attach the new level to level_root
	level_root.call_deferred("add_child", next_level)
	level_changed.emit(current_level.scene_file_path, next_level.scene_file_path)
	
	current_level = next_level
	set_process(true)
