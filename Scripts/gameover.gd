extends Node2D


func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Office/office.tscn")
	$pressed_button_sfx.play()

func _on_retry_button_mouse_entered() -> void:
	$Arrow.position.x = $"retry_button".position.x
	$entered_button_sfx.play()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	$pressed_button_sfx.play()

func _on_main_menu_button_mouse_entered() -> void:
	$Arrow.position.x = $"main_menu_button".position.x
	$entered_button_sfx.play()
