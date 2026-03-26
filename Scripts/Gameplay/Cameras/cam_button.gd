extends Button

@export var cam_name: String

@onready var cameras: Node2D = $"../../Cameras"
@onready var click: AudioStreamPlayer = $"../../Click"



func _ready() -> void:
	connect("pressed", _on_pressed)


func _on_pressed() -> void:
	cameras.watch = cam_name
	click.play()
