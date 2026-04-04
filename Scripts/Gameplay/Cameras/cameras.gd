extends Node2D

@export var all_rooms: Dictionary[String, AnimatedSprite2D] = {}
@export var bonnie: Node
@export var chica: Node
@export var freddy: Node
@export var foxy: Node

@onready var anim_tree: AnimationTree = get_parent().get_node("AnimationTree")

var watch: String = "stage"


func update_cams() -> void:
	# Stage
	match [bonnie.pos, chica.pos, freddy.pos]:
		["stage", "stage", "stage"]:
			all_rooms["stage"].play("all_looking" if randi_range(1, 1000) == 1 else "default")
		[_, "stage", "stage"]:
			all_rooms["stage"].play("chica_freddy")
		["stage", _, "stage"]:
			all_rooms["stage"].play("bonnie_freddy")
		[_, _, "stage"]:
			all_rooms["stage"].play("freddy_locking" if randi_range(1, 10) == 1 else "freddy")
		[_, _, _]:
			all_rooms["stage"].play("all")
	
	# Dining Area
	match [bonnie.pos, chica.pos, freddy.pos]:
		["dining_area", _, _]:
			all_rooms["dining_area"].play("bonnie" if randi_range(1, 2) == 1 else "bonnie_2")
		[_, "dining_area", _]:
			all_rooms["dining_area"].play("chica" if randi_range(1, 2) == 1 else "chica_2")
		[_, _, "dining_area"]:
			all_rooms["dining_area"].play("freddy")
		[_, _, _]:
			all_rooms["dining_area"].play("default")
	
	# Pirate Cove
	match foxy.pos:
		pass
	
	# Restrooms
	match [chica.pos, freddy.pos]:
		["restrooms", _]:
			all_rooms["restrooms"].play("chica" if randi_range(1, 2) == 1 else "chica_2")
		[_, "restrooms"]:
			all_rooms["restrooms"].play("freddy")
		[_, _]:
			all_rooms["restrooms"].play("default")
	
	# Kitchen
	match chica.pos:
		"kitchen":
			pass
		_:
			pass
	
	# Backstage
	match bonnie.pos:
		"backstage":
			all_rooms["backstage"].play("bonnie" if randi_range(1, 2) == 1 else "bonnie_2")
		_:
			all_rooms["backstage"].play("looking" if randi_range(1, 20) == 1 else "default")
	
	# West Hall Corner
	match [bonnie.pos, foxy.pos]:
		["west_hall_corner", _]:
			all_rooms["west_hall_corner"].play("bonnie")
		[_, "west_hall_corner"]:
			all_rooms["west_hall_corner"].play("foxy_running")
		[_, _]:
			all_rooms["west_hall_corner"].play("default")
	
	# East Hall Corner
	match [chica.pos, freddy.pos]:
		["east_hall_corner", _]:
			all_rooms["east_hall_corner"].play("chica_2" if randi_range(1, 20) == 1 else "chica")
		[_, "east_hall_corner"]:
			all_rooms["east_hall_corner"].play("freddy")
		[_, _]:
			all_rooms["east_hall_corner"].play("default")
	
	# Supply Room
	match bonnie.pos:
		"supply_room":
			all_rooms["supply_room"].play("bonnie")
		_:
			all_rooms["supply_room"].play("default")
	
	# West Hall
	match bonnie.pos:
		"west_hall":
			all_rooms["west_hall"].play("bonnie")
		_:
			all_rooms["west_hall"].play("poster_glitch" if randi_range(1, 10) == 1 else "default")
	
	# East Hall
	match [chica.pos, freddy.pos]:
		["east_hall", _]:
			all_rooms["east_hall"].play("chica")
		[_, "east_hall"]:
			all_rooms["east_hall"].play("freddy")
		[_, _]:
			all_rooms["east_hall"].play("default")
	
	play_static()

func play_static() -> void:
	anim_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	anim_tree.advance(0) # this fixes a problem where the static plays 1 frame too late	animation_tree[""]
