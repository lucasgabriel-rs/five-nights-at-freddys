extends AnimatedSprite2D

var lights: String

func _process(_delta: float) -> void:
	match lights:
		"right": self.play("right light")
		"left": self.play("left light")
		_: self.play("default")
	
	buttons()

func _on_left_light_pressed() -> void:
	if lights == "": lights = "left"
	else: lights = ""

func _on_right_light_pressed() -> void:
	if lights == "": lights = "right"
	else: lights = ""

func _on_noise_pressed() -> void:
	$Noise.play()

func buttons() -> void:
	if lights == "left" and Global.leftDoor == true: $"Doors/Left Buttons".play("both")
	elif lights == "left": $"Doors/Left Buttons".play("light")
	elif Global.leftDoor == true: $"Doors/Left Buttons".play("door")
	else: $"Doors/Left Buttons".play("default")
	
	if lights == "right" and Global.rightDoor == true: $"Doors/Right Buttons".play("both")
	elif lights == "right": $"Doors/Right Buttons".play("light")
	elif Global.rightDoor == true: $"Doors/Right Buttons".play("door")
	else: $"Doors/Right Buttons".play("default")
