extends AnimatedSprite2D

var toggle: bool = false

@onready var cam_view: Camera2D = %PlayerView
@onready var cams: Node2D = $"../CamerasElements"
@onready var put_up: AudioStreamPlayer = $PutUp
@onready var put_down: AudioStreamPlayer = $PutDown


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("monitor"):
		if not toggle:
			play("default")
			put_up.play()
			toggle = true
			cam_view.global_position.x = cam_view.START_POS
			await animation_finished
			cams.visible = true
			visible = false
		else:
			visible = true
			play_backwards("default")
			put_up.stop()
			put_down.play()
			toggle = false
			await frame == 0
			cams.visible = false
