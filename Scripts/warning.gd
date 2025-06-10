extends Control

var menu: PackedScene = preload("res://Scenes/menu.tscn")
var canRun = true
func _ready() -> void:
	if Steam.isSteamRunning():
		if !Steam.isSubscribedApp(319510):
			$Label.text = "WARNING:\nYou Must Have an Original Five Night at Freddys Copy!!"
			canRun = false
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if canRun: get_tree().change_scene_to_packed(menu)
	else: get_tree().quit()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Skip Warning"):
		if canRun: get_tree().change_scene_to_packed(menu)
		else: get_tree().quit()
