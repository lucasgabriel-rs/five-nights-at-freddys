extends Node2D

func _on_left_door_button_pressed() -> void:
	if Global.leftDoor == false:
		$"Left Door".play()
		Global.leftDoor = true
	else:
		$"Left Door".play_backwards()
		Global.leftDoor = false

func _on_right_door_button_pressed() -> void:
	if Global.rightDoor == false:
		$"Right Door".play()
		Global.rightDoor = true
	else:
		$"Right Door".play_backwards()
		Global.rightDoor = false
