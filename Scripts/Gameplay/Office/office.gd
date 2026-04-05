extends Node

@onready var office: AnimatedSprite2D = $Office
@onready var right_door: Area2D = %RightDoor
@onready var left_door: Area2D = %LeftDoor
@onready var freddy_button: Button = $Office/Freddy
@onready var noise: AudioStreamPlayer = $Office/Freddy/Noise
@onready var tablet: AnimatedSprite2D = %Tablet
@onready var light: AudioStreamPlayer = $Light
@onready var windows: AudioStreamPlayer = $Windows
@onready var bonnie: Node = %Bonnie
@onready var chica: Node = %Chica

var lights: String = "none"


func _ready() -> void:
	# Lights
	right_door.connect("input_event", _on_right_light_input)
	left_door.connect("input_event", _on_left_light_input)
	
	# Cursor
	right_door.connect("mouse_entered", _on_mouse_entered)
	left_door.connect("mouse_entered", _on_mouse_entered)
	right_door.connect("mouse_exited", _on_mouse_exited)
	left_door.connect("mouse_exited", _on_mouse_exited)
	
	# freddy_button's Noise
	freddy_button.connect("pressed", _noise_freddy)


func _on_right_light_input(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and not tablet.toggle:
			_light_on("right_light")
		else: _light_off()

func _on_left_light_input(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and not tablet.toggle:
			_light_on("left_light")
		else: _light_off()


func _on_mouse_entered() -> void:
	if not tablet.toggle:
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)


func _on_mouse_exited() -> void:
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)


func _noise_freddy() -> void:
	noise.play()


func _light_on(input: String) -> void:
	if input == "right_light":
		office.play("chica" if chica.pos == "right_door" else input)
	else:
		office.play("bonnie" if bonnie.pos == "left_door" else input)
	light.play()


func _light_off() -> void:
	office.play("default")
	light.stop()
