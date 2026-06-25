extends AnimatedSprite2D

# Objets
@onready var cam_view: Camera2D = %PlayerView
@onready var cams: Node2D = $"../CamerasElements"
@onready var put_up: AudioStreamPlayer = $PutUp
@onready var put_down: AudioStreamPlayer = $PutDown

# Variable
var toggle: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("monitor"):
		if not toggle:
			cam_view.global_position.x = cam_view.START_POS
			
			play()
			put_up.play()
			
			toggle = true
			
			await animation_finished
			cams.visible = true
			visible = false
		else:
			cams.visible = false
			visible = true
			
			play_backwards()
			put_up.stop()
			put_down.play()
			
			toggle = false
