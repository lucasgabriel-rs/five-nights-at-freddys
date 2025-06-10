extends Control

var menu: PackedScene = preload("res://Scenes/menu.tscn")
var canRun = true

func _ready():
	#if Steam.restartAppIfNecessary(319510):  # Substitua 480 pelo AppID do seu jogo na Steam
		#get_tree().quit()
		#print("Bruh")

	if Steam.isSteamRunning():
		print("Steam está rodando.")
		
		if Steam.isSubscribedApp(319510):  # Substitua pelo AppID do jogo que você quer verificar
			print("O jogador possui o jogo!")
		else:
			$Label.text = "WARNING:\nYou Must Have An Original Five Nights At Freddys Copy!"
			canRun = false
			
	else:
		$Label.text = "WARNING:\nYou Must Run Steam First"
		canRun = false


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if canRun:
		get_tree().change_scene_to_packed(menu)
	else:
		get_tree().quit()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Skip Warning"):
		if canRun:
			get_tree().change_scene_to_packed(menu)
		else:
			get_tree().quit()
