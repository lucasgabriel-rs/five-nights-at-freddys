extends AnimatedSprite2D

@export var is_right_door: bool
var is_close: bool = false
@onready var close: AudioStreamPlayer2D = $Close


func _process(_delta: float) -> void:
	if is_right_door:
		if Input.is_action_just_pressed("right_door"):
			_animation_door("right")
	else:
		if Input.is_action_just_pressed("left_door"):
			_animation_door("left")


func _animation_door(door: String) -> void:
	if is_close:
		play_backwards(door)
		close.play()
		is_close = false
	else:
		play(door)
		close.play()
		is_close = true
	
