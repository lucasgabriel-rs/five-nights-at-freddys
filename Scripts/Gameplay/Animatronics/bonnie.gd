extends Node

const INIT_POS: String = "stage"
const WAIT_TIME: float = 4.97
const JUMPSCARE_TIME: float = 5.0

var pos: String = INIT_POS
var lvl_ai: float


const CONNECTIONS: Dictionary = {
	"stage": ["dining_area", "backstage"],
	"dining_area": ["west_hall_corner"],
	"backstage": ["west_hall_corner"],
	"west_hall_corner": ["west_hall"],
	"supply_room": ["left_door"],
	"west_hall": ["left_door", "supply_room"],
	"left_door": ["dining_area"]
}

@onready var timer: Timer = Timer.new()
@onready var left_door: Area2D = $"../../Office/Doors/LeftDoor"


func _ready() -> void:
	add_child(timer)
	timer.wait_time = WAIT_TIME
	timer.autostart = true
	timer.connect("timeout", _mov_opportunity)
	timer.start()

func _mov_opportunity() -> void:
	print(pos)
	if lvl_ai >= randi_range(1, 20):
		var options = CONNECTIONS[pos]
		pos = options.pick_random()
		
		if pos == "left_door":
			await get_tree().create_timer(JUMPSCARE_TIME).timeout
			if not left_door.is_close:
				print("jumpscare!")
				get_tree().quit()
