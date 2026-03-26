extends Node

var lights: String = "none"

@onready var office: AnimatedSprite2D = $Office
@onready var right_door: Area2D = $Office/Doors/RightDoor
@onready var left_door: Area2D = $Office/Doors/LeftDoor
@onready var freddy: Button = $Office/Freddy
@onready var noise: AudioStreamPlayer = $Office/Freddy/Noise
@onready var light: AudioStreamPlayer = $Sounds/Light
@onready var windows: AudioStreamPlayer = $Sounds/Windows


func _ready() -> void:
	# Lights
	right_door.connect("input_event", _on_right_light_input)
	left_door.connect("input_event", _on_left_light_input)
	
	# Cursor
	right_door.connect("mouse_entered", _on_mouse_entered)
	left_door.connect("mouse_entered", _on_mouse_entered)
	right_door.connect("mouse_exited", _on_mouse_exited)
	left_door.connect("mouse_exited", _on_mouse_exited)
	
	# Freddy's Noise
	freddy.connect("pressed", _noise_freddy)


func _on_right_light_input(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_light_on("right_light")
			else: _light_off()

func _on_left_light_input(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_light_on("left_light")
			else: _light_off()


func _on_mouse_entered() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
	

func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _noise_freddy() -> void:
	noise.play()


func _light_on(input: String) -> void:
	office.play(input)
	light.play()


func _light_off() -> void:
	office.play("default")
	light.stop()
