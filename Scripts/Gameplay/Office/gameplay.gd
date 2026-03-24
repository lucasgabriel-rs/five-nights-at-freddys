extends Node

var lights: String = "none"

@onready var cam_pan: Camera2D = $CamPan
@onready var office: AnimatedSprite2D = $Office
@onready var right_door: AnimatedSprite2D = $Office/Doors/RightDoor
@onready var left_door: AnimatedSprite2D = $Office/Doors/LeftDoor
@onready var freddy: Button = $Office/Freddy
@onready var noise: AudioStreamPlayer = $Office/Freddy/Noise
@onready var light: AudioStreamPlayer = $Light
@onready var windows: AudioStreamPlayer = $Windows


func _ready() -> void:
	freddy.connect("pressed", _noise_freddy)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("right_light"):
		_light_on("right_light")
	
	if Input.is_action_just_pressed("left_light"):
		_light_on("left_light")
	
	if not Input.is_action_pressed("right_light") and not Input.is_action_pressed("left_light"):
		_light_off()

func _noise_freddy() -> void:
	noise.play()


func _light_on(input: String) -> void:
	office.play(input)
	light.play()


func _light_off() -> void:
	office.play("default")
	light.stop()
