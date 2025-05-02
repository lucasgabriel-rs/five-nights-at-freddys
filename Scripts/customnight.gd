extends Control

func _process(_delta: float) -> void:
	$Freddy/Difficult.text = str(Global.animatronics["freddy"]["difficult"][6])
	$Bonnie/Difficult.text = str(Global.animatronics["bonnie"]["difficult"][6])
	$Chica/Difficult.text = str(Global.animatronics["chica"]["difficult"][6])
	$Foxy/Difficult.text = str(Global.animatronics["foxy"]["difficult"][6])

func difficultAlt(n: String, d: String) -> void:
	match d:
		"l": 
			if Global.animatronics[n]["difficult"][6] < 20:
				Global.animatronics[n]["difficult"][6] += 1
		_:
			if Global.animatronics[n]["difficult"][6] > 0:
				Global.animatronics[n]["difficult"][6] -= 1

# Freddy
func _on_freddy_right_arrow_pressed() -> void:
	difficultAlt("freddy", "l")

func _on_freddy_left_arrow_pressed() -> void:
	difficultAlt("freddy", "r")

# Bonnie
func _on_bonnie_right_arrow_pressed() -> void:
	difficultAlt("bonnie", "l")

func _on_bonnie_left_arrow_pressed() -> void:
	difficultAlt("bonnie", "r")

# Chica
func _on_chica_right_arrow_pressed() -> void:
	difficultAlt("chica", "l")

func _on_chica_left_arrow_pressed() -> void:
	difficultAlt("chica", "r")

# Foxy
func _on_foxy_right_arrow_pressed() -> void:
	difficultAlt("foxy", "l")

func _on_foxy_left_arrow_pressed() -> void:
	difficultAlt("foxy", "r")


func _on_back_pressed() -> void:
	$Fade/Animation.play("Fade In")

func _on_ready_pressed() -> void:
	$Fade/Animation.play("Fade In 2")

func _on_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Fade In":
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	elif anim_name == "Fade In 2":
		get_tree().change_scene_to_packed(preload("res://Scenes/loading.tscn"))
