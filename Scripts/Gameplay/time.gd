extends Node

var time: int = 0
@onready var hours: Label = $Hours
@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.connect("timeout", _timeout)


func _process(_delta: float) -> void:
	if time > 0:
		hours.text = "%s AM" % [str(time)]
	else:
		hours.text = "12 AM"


func _timeout() -> void:
	if time < 6:
		time += 1
	else:
		get_tree().change_scene_to_file("res://Scenes/Gameplay/6AM.tscn")
