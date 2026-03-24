extends Control

func _on_animation_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(load("res://Scenes/Office/office.tscn"))
	
	if Save.night != 6: Save.night += 1
