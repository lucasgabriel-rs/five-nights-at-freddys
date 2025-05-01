extends Node2D

var monitor: bool = false
@onready var cameras: Node2D = $"../Cameras"
@onready var ui: CanvasLayer = $"../Cameras/UI"

func _ready() -> void:
	$Activation/Activation.connect("mouse_entered", activation)
	$Monitor.connect("animation_finished", animationFinished)

func activation() -> void:
	if monitor == false: # Checks if the monitor variable is false. If it is false it will play animation
		$Monitor.play()
		monitor = true
		$put.play()
	else: # If it is true it will play reverse animation
		$Monitor.play_backwards()
		monitor = false
		cameras.visible = false
		ui.visible = false
		$putDown.play()
		if $put.is_playing():
			$put.stop()

func animationFinished() -> void:
	if monitor == true:
		cameras.visible = true
		ui.visible = true
