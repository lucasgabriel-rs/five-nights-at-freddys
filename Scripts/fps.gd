extends Label

#var fps = "FPS: %s" % [Engine.get_frames_per_second()]
#var freddy = "\nFreddy position: %s" % [Global.animatronicPos("freddy")]
#var foxy = "\nFoxy position: %s" % [Global.animatronicPos("foxy")]

func _process(_delta: float) -> void:
	self.text = "FPS: %s" % [Engine.get_frames_per_second()] + "\nBonnie position: %s" % [Global.animatronicPos("bonnie")] + "\nChica position: %s" % [Global.animatronicPos("chica")] + "\nTimer: %s" % [snapped($"../Cameras/Timer".time_left, 1)]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Depuration"):
		if self.visible == true: self.visible = false
		else: self.visible = true
