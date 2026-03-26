extends AnimatedSprite2D

var toggle: bool = true
@onready var cam_view: Camera2D = get_parent().get_parent()
@onready var cams: CanvasLayer = $"../../../Cams"


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("monitor"):
		if toggle:
			play("default")
			toggle = false
			cam_view.global_position.x = cam_view.START_POS
			await animation_finished
			cams.visible = true
			visible = false
		else:
			visible = true
			play_backwards("default")
			toggle = true
			await frame == 0
			cams.visible = false
