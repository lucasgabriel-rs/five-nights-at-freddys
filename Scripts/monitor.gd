extends Node2D

var monitor: bool = false

func _on_activation_mouse_entered() -> void:
	if monitor == false: # Checks if the monitor variable is false. If it is false it will play animation
		$Monitor.play()
		monitor = true
	else: # If it is true it will play reverse animation
		$Monitor.play_backwards()
		monitor = false
