extends Area2D

# Editor's object
@export var is_right_door: bool

# Objects
@onready var close: AudioStreamPlayer2D = $Close
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Variable
var is_close: bool = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("right_door" if is_right_door else "left_door"):
		_animation_door("right" if is_right_door else "left")


func _animation_door(door: String) -> void:
	if is_close:
		animated_sprite_2d.play_backwards(door)
		close.play()
		is_close = false
	else:
		animated_sprite_2d.play(door)
		close.play()
		is_close = true
