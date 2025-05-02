extends Control

var menu: PackedScene = preload("res://Scenes/menu.tscn")

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(menu)
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Skip Warning"):
		get_tree().change_scene_to_packed(menu)
