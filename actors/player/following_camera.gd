extends Camera2D


var tilemap : TileMap


func _ready() -> void:
	LevelManager.level_changed.connect(_on_level_changed)
	if not tilemap:
		find_tilemap()
		setup_camera()


func find_tilemap() -> void:
	var current_level = LevelManager.current_level
	tilemap = current_level.find_child("TileMap")
	assert(tilemap)


func _on_level_changed(_old_level: String, _new_level: String) -> void:
	find_tilemap()
	setup_camera()


func setup_camera() -> void:
	var map_rect = tilemap.get_used_rect()
	var tile_size : int = tilemap.cell_quadrant_size
	var world_size_in_px : Vector2 = Vector2(map_rect.size.x, map_rect.size.y) * Vector2(tile_size, tile_size)
	
	limit_top = -tile_size
	limit_left = limit_top
	limit_right = world_size_in_px.x + limit_left
	limit_bottom = world_size_in_px.y + limit_top
