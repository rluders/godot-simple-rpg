extends Marker2D

@onready var label : Label = $Label

var amount : float


func _ready() -> void:
	label.text = str(amount)
	var tween : = create_tween()
	tween.tween_property(self, "position", Vector2(position.x, position.y - 20), .2)
	tween.tween_property(self, "modulate:a", 0, .5)
	await tween.finished
	queue_free()
