extends Control

func _process(delta: float) -> void: #$Label.text = "%sst Night\n12 AM" % [Global.night + 1]
	match Global.night:
		0: $Label.text = "%sst Night\n12 AM" % [Global.night + 1]
		1: $Label.text = "%snd Night\n12 AM" % [Global.night + 1]
		3: $Label.text = "%srd Night\n12 AM" % [Global.night + 1]
		_: $Label.text = "%sth Night\n12 AM" % [Global.night + 1]

func _on_animation_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(load("res://Scenes/Office/office.tscn"))
