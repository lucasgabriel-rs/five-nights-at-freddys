extends Node2D

var cameras: Array = [
	$Stage, # id 0
	$"Dining Area", # id 1
	$"Pirate Cove", # id 2
	$Restrooms, # id 3
	$Backstage, # id 4
	$"West Hall Corner", # id 5
	$"East Hall Corner", # id 6
	$"West Hall", # id 7
	$"East Hall", # id 8
	$Kitchen # id 9
]

@onready var supply_room: AnimatedSprite2D = $"UI/Supply Room"

func _process(_delta: float) -> void:
	if Global.animatronics["bonnie"]["isInStage"] == true and Global.animatronics["chica"]["isInStage"] == true and Global.animatronics["freddy"]["isInStage"] == true:
		cameras[0].play("default")
	elif Global.animatronics["bonnie"]["isInStage"] == false and Global.animatronics["chica"]["isInStage"] == true and Global.animatronics["freddy"]["isInStage"] == true:
		cameras[0].play("chica and freddy")
	elif Global.animatronics["bonnie"]["isInStage"] == true and Global.animatronics["chica"]["isInStage"] == false and Global.animatronics["freddy"]["isInStage"] == true:
		cameras[0].play("bonnie and freddy")
	elif Global.animatronics["bonnie"]["isInStage"] == false and Global.animatronics["chica"]["isInStage"] == false and Global.animatronics["freddy"]["isInStage"] == true:
		cameras[0].play("freddy")
	else: cameras[0].play("empty")

func _on_cam_1a_pressed() -> void:
	$"blip".play()
	cameras[0].visible = true
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_1b_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = true
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_1c_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = true
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_2a_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = true
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_2b_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = true
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_3_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = true
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_4a_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = true
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_4b_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = true
	cameras[9].visible = false

func _on_cam_5_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = true
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_cam_6_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = false
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = true

func _on_cam_7_pressed() -> void:
	$"blip".play()
	cameras[0].visible = false
	cameras[1].visible = false
	cameras[2].visible = false
	cameras[3].visible = true
	cameras[4].visible = false
	cameras[5].visible = false
	cameras[6].visible = false
	supply_room.visible = false
	cameras[7].visible = false
	cameras[8].visible = false
	cameras[9].visible = false

func _on_timer_timeout() -> void:
	Global.ai("bonnie")
	cameraUpdate("bonnie")
	Global.ai("chica")
	cameraUpdate("chica")

func cameraUpdate(animatronic: String) -> void:
	match animatronic:
		"bonnie":
			match Global.animatronicPos(animatronic):
				"dining area":
					cameras[1].play(["bonnie 1", "bonnie 2"].pick_random())
					cameras[4].play("default")
					cameras[5].play("default")
				"backstage":
					cameras[1].play("default")
					cameras[4].play(["bonnie 1", "bonnie 2"].pick_random())
					cameras[5].play("default")
				"west hall corner":
					cameras[1].play("default")
					cameras[4].play("default")
					cameras[5].play("bonnie")
					supply_room.play("default")
					cameras[7].play("default")
				"supply room":
					cameras[5].play("default")
					supply_room.play("bonnie")
					cameras[7].play("default")
				"west hall":
					cameras[5].play("default")
					supply_room.play("default")
					cameras[7].play("bonnie")
				"door":
					cameras[5].play("default")
					cameras[7].play("default")
		"chica":
			match Global.animatronicPos(animatronic):
				"dining area":
					cameras[1].play(["chica 1", "chica 2"].pick_random())
					cameras[3].play("default")
					cameras[6].play("default")
					cameras[8].play("default")
				"restrooms":
					cameras[1].play("default")
					cameras[3].play(["chica 1", "chica 2"].pick_random())
					cameras[6].play("default")
					cameras[8].play("default")
				"kitchen":
					cameras[1].play("default")
					cameras[3].play("default")
					cameras[6].play("default")
					cameras[8].play("default")
				"east hall corner":
					cameras[1].play("default")
					cameras[3].play("default")
					cameras[6].play(["chica 1", "chica 2"].pick_random())
					cameras[8].play("default")
				"east hall":
					cameras[1].play("default")
					cameras[3].play("default")
					cameras[6].play("default")
					cameras[8].play("chica")
				"door":
					cameras[1].play("default") # Dining Room
					cameras[3].play("default") # Restroom
					cameras[6].play("default") # East Hall Corner
					cameras[8].play("default") # East Hall
