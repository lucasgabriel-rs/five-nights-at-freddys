extends Camera2D

const START_POS: float = 805.0 
@onready var monitor: AnimatedSprite2D = $CamEffects/Monitor


func _process(_delta: float) -> void:
	if not monitor.toggle:
		global_position.x = get_global_mouse_position().x
