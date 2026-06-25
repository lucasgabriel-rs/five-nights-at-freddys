extends Camera2D

@onready var tablet: AnimatedSprite2D = %Tablet

const START_POS: float = 805.0 


func _process(_delta: float) -> void:
	if not tablet.toggle:
		global_position.x = get_global_mouse_position().x
