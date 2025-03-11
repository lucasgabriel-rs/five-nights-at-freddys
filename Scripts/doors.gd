extends Node2D

var leftDoor: bool = false
var rightDoor: bool = false

func _on_left_door_button_pressed() -> void:
	if leftDoor == false:
		$"Left Door".play()
		$"Left Buttons".play("door")
		leftDoor = true
	else:
		$"Left Door".play_backwards()
		$"Left Buttons".play("default")
		leftDoor = false

func _on_right_door_button_pressed() -> void:
	if rightDoor == false:
		$"Right Door".play()
		$"Right Buttons".play("door")
		rightDoor = true
	else:
		$"Right Door".play_backwards()
		$"Right Buttons".play("default")
		rightDoor = false
