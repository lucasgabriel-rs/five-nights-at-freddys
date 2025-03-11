extends Node2D

func _on_left_door_button_pressed() -> void:
	if Global.leftDoor == false:
		$"Left Door".play()
		$"Left Buttons".play("door")
		Global.leftDoor = true
	else:
		$"Left Door".play_backwards()
		$"Left Buttons".play("default")
		Global.leftDoor = false

func _on_right_door_button_pressed() -> void:
	if Global.rightDoor == false:
		$"Right Door".play()
		$"Right Buttons".play("door")
		Global.rightDoor = true
	else:
		$"Right Door".play_backwards()
		$"Right Buttons".play("default")
		Global.rightDoor = false
