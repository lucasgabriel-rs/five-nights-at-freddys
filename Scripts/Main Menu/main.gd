extends ColorRect

var current: String = "menu"

@onready var loading_scene := preload("res://Scenes/loading.tscn")

@onready var new_game: Button = $Menu/MarginContainer/VBoxContainer/VBoxContainer/NewGame
@onready var load_game: Button = $Menu/MarginContainer/VBoxContainer/VBoxContainer/LoadGame
@onready var night_six: Button = $Menu/MarginContainer/VBoxContainer/VBoxContainer/Night6
@onready var custom_night: Button = $Menu/MarginContainer/VBoxContainer/VBoxContainer/CustomNight
@onready var exit: Button = $Menu/MarginContainer/VBoxContainer/VBoxContainer/Exit

func _ready() -> void:
	$"Custom Night".visible = false
	night_six.disabled = true
	custom_night.disabled = true


func _on_animation_player_animation_started(anim_name: StringName) -> void:
	if anim_name == 'newspaper':
		new_game.disabled = true
		load_game.disabled = true
		night_six.disabled = true
		custom_night.disabled = true
		exit.disabled = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade in":
		if current == "menu":
			$Menu.visible = true
			$"Custom Night".visible = false
		else:
			$Menu.visible = false
			$"Custom Night".visible = true
		
		$AnimationPlayer.play("fade out")
	
	if anim_name == "newspaper":
		get_tree().change_scene_to_packed(loading_scene)

# Main Menu
func _on_new_game_pressed() -> void:
	$AnimationPlayer.play("newspaper")


func _on_load_game_pressed() -> void:
	get_tree().change_scene_to_packed(loading_scene)


func _on_night_6_pressed() -> void:
	get_tree().change_scene_to_packed(loading_scene)


func _on_custom_night_pressed() -> void:
	current = "customnight"
	$AnimationPlayer.play("fade in")


func _on_exit_pressed() -> void:
	get_tree().quit()
