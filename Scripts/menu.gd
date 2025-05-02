extends Node2D

var loadNight: PackedScene = preload("res://Scenes/Office/office.tscn")

func _on_new_game_pressed() -> void:
	$Newspaper/Animation.play("newspaper")

func _on_new_game_mouse_entered() -> void:
	$Arrow.position.y = $"New Game".position.y

func _on_load_game_mouse_entered() -> void:
	$Arrow.position.y = $"Load Game".position.y

func _on_animation_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(loadNight)
