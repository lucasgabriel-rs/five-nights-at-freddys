extends AnimatedSprite2D

@onready var cameras: Node2D = get_parent()
@export var cam_name: String

func _process(_delta: float) -> void:
	if cameras.watch == cam_name:
		visible = true
	else:
		visible = false
