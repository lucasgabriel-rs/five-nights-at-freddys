extends Button

@export var cam_name: String

@onready var cam_rooms: Node2D = $"../../CamRooms"
@onready var click: AudioStreamPlayer = $"../../Click"


func _ready() -> void:
	connect("pressed", _on_pressed)


func _on_pressed() -> void:
	cam_rooms.watch = cam_name
	click.play()
	cam_rooms.play_static()
