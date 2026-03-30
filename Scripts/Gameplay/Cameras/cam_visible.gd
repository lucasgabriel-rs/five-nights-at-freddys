extends AnimatedSprite2D

@export var cam_name: String = ""
@onready var cameras: Node2D = get_parent()

func _process(_delta: float) -> void:
	if cameras.watch == cam_name:
		visible = true
	else:
		visible = false
