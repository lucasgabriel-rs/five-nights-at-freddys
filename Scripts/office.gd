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
		"foxyjump": self.play("foxy_jumpscare")
		"freddyjump": self.play("freddy_normaljump")
		_: self.play("default")
	if Global.jumpscare and !Global.cameraUp:
		$Doors.visible = false
		$Fan.visible = false
		jumps()
	Sounds()
	buttons()

func jumps():
		if Global.brokeLeft == true:
			lights = "bonniejump"
			if self.frame == 22:
				Global.gameOver = true
		elif Global.brokeRight == true:
			lights = "chicajump"
			if self.frame == 32:
				Global.gameOver = true
		elif Global.canJump == "foxy":
			lights = "foxyjump"
			if self.frame == 21: Global.gameOver = true
		elif Global.canJump == "freddy":
			lights = "freddyjump"
			if self.frame == 29:
				Global.gameOver = true
		#if !$jumpscare1.is_playing(): $jumpscare1.play()

func Sounds():
	if Global.cameraUp and Global.jumpscare:
		if Global.brokeLeft or Global.brokeRight:
			match Global.breaths:
				1: if !$breaths/breath1.is_playing(): $breaths/breath1.play()
				2: if !$breaths/breath2.is_playing(): $breaths/breath2.play()
				3: if !$breaths/breath3.is_playing(): $breaths/breath3.play()
				4: if !$breaths/breath4.is_playing(): $breaths/breath4.play()
	if Global.animatronics["foxy"]["pos"] == "west hall corner" and Global.leftDoor: 
		if !$knock.is_playing(): $knock.play()

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
		if Global.brokeLeft == true: $broke.play()

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
		if Global.brokeRight == true: $broke.play()

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
