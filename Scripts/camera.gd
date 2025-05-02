extends Camera2D

func _process(_delta: float) -> void:
	if Global.scarenow == false:
		self.global_position.x = get_global_mouse_position().x
