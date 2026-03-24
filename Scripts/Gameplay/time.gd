extends Timer

var time: int = 0


func _ready() -> void:
	connect("timeout", _timeout)


func _timeout() -> void:
	if time < 6:
		time += 1
	else:
		get_tree().change_scene_to_file("res://Scenes/Gameplay/6AM.tscn")
