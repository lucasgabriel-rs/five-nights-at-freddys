extends Node2D

@onready var camera: Camera2D = $CamPan
#var mouseOn: String = "null"
#const right: int = 448
func _ready() -> void:
	pass

func _process(_delta: float) -> void: 
	camera.global_position.x = get_global_mouse_position().x
