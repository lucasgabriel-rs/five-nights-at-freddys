extends Control

@onready var label: Label = $Label

func _process(_delta: float) -> void:
	match Save.night:
		0: label.text = "%sst Night\n12 AM" % [Save.night + 1]
		1: label.text = "%snd Night\n12 AM" % [Save.night + 1]
		3: label.text = "%srd Night\n12 AM" % [Save.night + 1]
		_: label.text = "%sth Night\n12 AM" % [Save.night + 1]

func _on_animation_animation_finished(_anim_name: StringName) -> void:
	get_tree().change_scene_to_file("res://Scenes/Gameplay/Office/office.tscn")
