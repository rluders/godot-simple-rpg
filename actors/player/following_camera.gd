extends Camera2D


@export var tilemap : TileMap


func _ready() -> void:
	var map_rect : = tilemap.get_used_rect()
	var tile_size : = tilemap.cell_quadrant_size
	var world_size_in_px : = map_rect.size * tile_size
	
	limit_left = 0
	limit_top = 0
	limit_right = world_size_in_px.x
	limit_bottom = world_size_in_px.y
