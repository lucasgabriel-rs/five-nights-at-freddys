extends Label

var fps = "FPS: %s" % [Engine.get_frames_per_second()]
var bonnie: String = "\nBonnie position: %s" % [Global.animatronicPos("bonnie")]
var chica: String = "\nChica position: %s" % [Global.animatronicPos("chica")]
var freddy: String = "\nFreddy position: %s" % [Global.animatronicPos("freddy")]
var foxy: String = "\nFoxy position: %s" % [Global.animatronicPos("foxy")]

func _process(_delta: float) -> void:
	self.text = fps + bonnie + chica + freddy + foxy + "\nTimer: %s" % [snapped($"../Cameras/Timer".time_left, 1)]
