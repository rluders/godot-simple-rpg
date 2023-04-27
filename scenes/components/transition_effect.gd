extends Control

signal transition_finished

@onready var rect : TextureRect = $TextureRect
@onready var anim_player : AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	LevelManager.level_changed.connect(_on_level_changed)


func _on_level_changed(_old_level: String, _new_level: String) -> void:
	var img : Image = get_viewport().get_texture().get_image()
	img.flip_y()
	
	var screenshot = ImageTexture.create_from_image(img)
	rect.texture = screenshot
	
	anim_player.play("default")
	await anim_player.animation_finished
	transition_finished.emit()
