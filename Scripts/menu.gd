extends Node2D

# Buttons Click
func _on_new_game_pressed() -> void: $Animation.play("Newspaper")

func _on_load_game_pressed() -> void: $Animation.play("Fade In")

func _on_night_vi_pressed() -> void: $Animation.play("Fade In")

func _on_custom_night_pressed() -> void: $Animation.play("Fade In 2")

# Mouse Entered
func _on_new_game_mouse_entered() -> void: arrow($"New Game")

func _on_load_game_mouse_entered() -> void: arrow($"Load Game")

func _on_night_vi_mouse_entered() -> void: arrow($"Night VI")

func _on_custom_night_mouse_entered() -> void: arrow($"Custom Night")

# Load to Loading Screen
func _on_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Newspaper" or anim_name == "Fade In":
		get_tree().change_scene_to_packed(preload("res://Scenes/loading.tscn"))
	elif anim_name == "Fade In 2":
		get_tree().change_scene_to_packed(preload("res://Scenes/customnight.tscn"))

# Freddy's Twitch
func _on_twitch_timeout() -> void:
	if randi_range(1, 20) > 19: $Freddy.frame = randi_range(1, 3)
	else: $Freddy.frame = 0

# Arrow Y Position Function
func arrow(n: Button) -> void: $Arrow.position.y = n.position.y
