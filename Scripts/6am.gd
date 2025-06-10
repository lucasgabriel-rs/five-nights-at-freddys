extends Control

func _on_animation_animation_finished(anim_name: StringName) -> void:
	Global.hours = 0
	get_tree().change_scene_to_packed(load("res://Scenes/Office/office.tscn"))
	
	if Global.night != 6: Global.night += 1
