extends Node2D

var watch: String = "stage"
const ALL_CAM_ROOMS_ID: Dictionary = {
	"stage": 0,
	"dining_area": 1,
	"pirate_cove": 2,
	"restrooms": 3,
	"kitchen": 4,
	"backstage": 5,
	"west_hall_corner": 6,
	"east_hall_corner": 7,
	"supply_room": 8,
	"west_hall": 9,
	"east_hall": 10
}

@onready var anim_tree: AnimationTree = $"../AnimationTree"
@export var bonnie: Node
@export var all_cam_rooms: Array[AnimatedSprite2D]


func _bonnie_rooms() -> void:
	match bonnie.pos:
		"stage":
			pass
		"dining_area": 
			pass
		"backstage": 
			pass
		"west_hall_corner": 
			pass
		"supply_room": 
			pass
		"west_hall": 
			pass


func play_static() -> void:
	anim_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
	anim_tree.advance(0) # this fixes a problem where the static plays 1 frame too late	animation_tree[""]
