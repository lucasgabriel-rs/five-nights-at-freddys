extends AnimatedSprite2D

var toggle: bool = false

@onready var cam_view: Camera2D = get_parent().get_parent()
@onready var cams: CanvasLayer = $"../../../Cams"
@onready var monitor_put_up: AudioStreamPlayer = $"../../../Sounds/MonitorPutUp"
@onready var monitor_put_down: AudioStreamPlayer = $"../../../Sounds/MonitorPutDown"



func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("monitor"):
		if not toggle:
			play("default")
			monitor_put_up.play()
			toggle = true
			cam_view.global_position.x = cam_view.START_POS
			await animation_finished
			cams.visible = true
			visible = false
		else:
			visible = true
			play_backwards("default")
			monitor_put_up.stop()
			monitor_put_down.play()
			toggle = false
			await frame == 0
			cams.visible = false
