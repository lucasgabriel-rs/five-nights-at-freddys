extends Label

func _process(_delta: float) -> void:
	if Global.hours == 0: self.text = "12 AM"
	else: self.text = "%s AM" % [Global.hours]
	
	if Global.hours == 6: get_tree().change_scene_to_packed(load("res://Scenes/6AM.tscn"))

func _on_timer_timeout() -> void:
	Global.hours += 1
