extends AnimatedSprite2D

@export var cam_name: String = ""

@onready var cameras: Node2D = get_parent()

func _process(_delta: float) -> void:
	visible = true if cameras.watch == cam_name else false
