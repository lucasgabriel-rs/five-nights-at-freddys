extends Node2D
var gameOverScreen: PackedScene= preload("res://Scenes/menu.tscn")
var breaths = [$Gui/breaths/breath1, $Gui/breaths/breath2, $Gui/breaths/breath3, $Gui/breaths/breath4]

func _process(delta: float) -> void:
	if Global.gameOver == true or Input.is_action_just_pressed("ui_down"):
		Global.reset()
		get_tree().change_scene_to_packed(gameOverScreen)
		pass
