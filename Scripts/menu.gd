extends Node2D

func _on_new_game_pressed() -> void:
	$"Newspaper/Newspaper Fade".play("newspaper")

func _on_new_game_mouse_entered() -> void:
	$Arrow.position.y = $"New Game".position.y

func _on_load_game_mouse_entered() -> void:
	$Arrow.position.y = $"Load Game".position.y

func _on_newspaper_fade_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(load("res://Scenes/loading.tscn"))

func _on_twitch_timeout() -> void:
	if randi_range(1, 20) > 19: $Freddy.frame = randi_range(1, 3)
	else: $Freddy.frame = 0
