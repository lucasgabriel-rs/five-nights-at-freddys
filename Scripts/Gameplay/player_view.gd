extends Camera2D

const START_POS: float = 805.0 
@onready var tablet: AnimatedSprite2D = %Tablet


func _process(_delta: float) -> void:
	if not tablet.toggle:
		global_position.x = get_global_mouse_position().x
