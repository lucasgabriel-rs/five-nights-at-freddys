extends Camera2D

func _process(_delta: float) -> void: 
	self.global_position.x = get_global_mouse_position().x
