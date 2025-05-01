extends AnimatedSprite2D

var lights: String = "none"

func _process(_delta: float) -> void:
	match lights:
		"right": self.play("right light")
		"left": self.play("left light")
		"bonnie": self.play("bonnie")
		"chica": self.play("chica")
		_: self.play("default")
	buttons()

func _on_left_light_pressed() -> void:
	if lights == "none":
		if Global.animatronics["bonnie"]["pos"] == "door":
			lights = "bonnie"
			$"window scare".play()
		else:
			lights = "left"
			$"lights sound".play()
	else: 
		lights = "none"
		$"lights sound".stop()

func _on_right_light_pressed() -> void:
	if lights == "none": 
		if Global.animatronics["chica"]["pos"] == "door":
			lights = "chica"
			$"window scare".play()
		else:
			lights = "right"
			$"lights sound".play()
	else: 
		lights = "none"
		$"lights sound".stop()

func _on_noise_pressed() -> void: $Noise.play()

func buttons() -> void:
	if lights == "left" or lights == "bonnie" and Global.leftDoor == true: $"Doors/Left Buttons".play("both")
	elif lights == "left" or lights == "bonnie": $"Doors/Left Buttons".play("light")
	elif Global.leftDoor == true: $"Doors/Left Buttons".play("door")
	else: $"Doors/Left Buttons".play("default")
	
	if lights == "right" or lights == "chica" and Global.rightDoor == true: $"Doors/Right Buttons".play("both")
	elif lights == "right" or lights == "chica": $"Doors/Right Buttons".play("light")
	elif Global.rightDoor == true: $"Doors/Right Buttons".play("door")
	else: $"Doors/Right Buttons".play("default")
