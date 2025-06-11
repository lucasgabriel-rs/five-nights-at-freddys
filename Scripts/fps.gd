extends Label

#var fps = "FPS: %s" % [Engine.get_frames_per_second()]
#var freddy = "\nFreddy position: %s" % [Global.animatronicPos("freddy")]
#var foxy = "\nFoxy position: %s" % [Global.animatronicPos("foxy")]

func _process(_delta: float) -> void:
	self.text = "FPS: %s" % [Engine.get_frames_per_second()] + "\nBonnie position: %s" % [Global.animatronicPos("bonnie")] + "\nChica position: %s" % [Global.animatronicPos("chica")] + "\nFoxy pos: %s"%[Global.animatronicPos("foxy")] + "\nFreddy pos: %s" % [Global.animatronicPos("freddy")] + "\nTimer: %s" % [snapped($"../Cameras/Timer".time_left, 1)]
