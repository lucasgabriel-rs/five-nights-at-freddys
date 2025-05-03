extends AnimatedSprite2D

var lights: String = "none"
var bon1: bool = false
var chic1: bool = false

func _process(_delta: float) -> void:
	match lights:
		"right": self.play("right light")
		"left": self.play("left light")
		"bonnie": self.play("bonnie")
		"chica": self.play("chica")
		"bonniejump": self.play("bonnie_jumpscare")
		"chicajump": self.play("chica_jumpscare")
		_: self.play("default")
	if Global.scarenow == true:
		$Doors.visible = false
		jumps()
	if Global.brokeLeft == true and Global.cameraUp == true:
		breathsSound(false)
	buttons()

func jumps():
	if Global.scarenow == true:
		if Global.brokeLeft == true:
			lights = "bonniejump"
			if self.frame == 21:
				Global.gameOver = true
		elif Global.brokeRight == true:
			lights = "chicajump"
			if self.frame == 32:
				Global.gameOver = true
		if !$jumpscare1.is_playing():
			$jumpscare1.play()

func breathsSound(t):
	if !$breaths/breath1.is_playing() and !t:
		$breaths/breath1.play()
		t = true
		print("respiro!!")

func _on_left_light_pressed() -> void:
	if lights == "none" and !Global.brokeLeft:
		if Global.animatronics["bonnie"]["pos"] == "door":
			lights = "bonnie"
			if !bon1:
				$"window scare".play()
			else:
				$"lights sound".play()
			bon1 = true
		else:
			lights = "left"
			$"lights sound".play()
			bon1 = false
	else: 
		lights = "none"
		$"lights sound".stop()
		if Global.brokeLeft == true: $brokeL.play()

func _on_right_light_pressed() -> void:
	if lights == "none" and Global.brokeRight == false: 
		if Global.animatronics["chica"]["pos"] == "door":
			lights = "chica"
			if !chic1:
				$"window scare".play()
			else:
				$"lights sound".play()
			chic1 = true
		else:
			lights = "right"
			$"lights sound".play()
			chic1 = false
	else: 
		lights = "none"
		$"lights sound".stop()
		if Global.brokeRight == true: $brokeR.play()

func _on_noise_pressed() -> void: $Noise.play()

func buttons() -> void:
	if !Global.brokeLeft:
		if Global.leftDoor == true and lights == "left" or lights == "bonnie" and Global.leftDoor == true: $"Doors/Left Buttons".play("both")
		elif lights == "left" or lights == "bonnie": $"Doors/Left Buttons".play("light")
		elif Global.leftDoor == true: $"Doors/Left Buttons".play("door")
		else: $"Doors/Left Buttons".play("default")
	else:  $"Doors/Left Buttons".play("default")
	
	if Global.brokeRight == false:
		if (Global.rightDoor == true and lights == "right") or lights == "chica" and Global.rightDoor == true: $"Doors/Right Buttons".play("both")
		elif lights == "right" or lights == "chica": $"Doors/Right Buttons".play("light")
		elif Global.rightDoor == true: $"Doors/Right Buttons".play("door")
		else: $"Doors/Right Buttons".play("default")
	else: $"Doors/Right Buttons".play("default")

func _on_timer_timeout() -> void:
	if Global.animatronics["bonnie"]["pos"] == "door" and Global.brokeLeft == false:
		Global.brokeLeft = true
	if Global.animatronics["chica"]["pos"] == "door" and Global.rightDoor == false:
		Global.brokeRight == true
