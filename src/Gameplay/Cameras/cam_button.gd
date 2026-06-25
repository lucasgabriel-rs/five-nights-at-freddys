extends Node2D

@export var cam_name: Array[String] = []

@onready var cam_rooms: Node2D = get_parent().get_node("CamRooms")
@onready var buttons = get_children()
@onready var click: AudioStreamPlayer = get_parent().get_node("Click")


func _ready() -> void:
	var button_idx: int = 0
	for button in buttons:
		button.connect("pressed", _on_pressed.bind(button_idx))
		button_idx += 1


func _on_pressed(idx: int) -> void:
	cam_rooms.watch = cam_name[idx]
	click.play()
	cam_rooms.update_cams()
