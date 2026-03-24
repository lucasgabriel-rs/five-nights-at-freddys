extends Control

# Buttons
@onready var retry_button: Button = $retry_button
@onready var main_menu_button: Button = $main_menu_button

# Arrow
@onready var arrow: Label = $Arrow

# Audios
@onready var gameover_sfx: AudioStreamPlayer = $gameover_sfx
@onready var entered_button_sfx: AudioStreamPlayer = $entered_button_sfx
@onready var pressed_button_sfx: AudioStreamPlayer = $pressed_button_sfx


func _on_retry_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Gameplay/Office/office.tscn")
	pressed_button_sfx.play()

func _on_retry_button_mouse_entered() -> void:
	arrow.position.x = retry_button.position.x
	entered_button_sfx.play()

func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pressed_button_sfx.play()

func _on_main_menu_button_mouse_entered() -> void:
	arrow.position.x = main_menu_button.position.x
	entered_button_sfx.play()
