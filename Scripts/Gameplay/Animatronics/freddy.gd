extends Node

const INIT_POS: String = "stage"
const WAIT_TIME: float = 4.98
const JUMPSCARE_TIME: float = 4.98

var pos: String = INIT_POS
var lvl_ai: float


const CONNECTIONS: Dictionary = {
	"stage": ["dining_area"],
	"dining_area": ["restrooms", "kitchen"],
	"restrooms": ["east_hall_corner"],
	"kitchen": ["east_hall_corner"],
	"east_hall_corner": ["east_hall"],
	"east_hall": ["right_door"],
	"right_door": ["dining_area", "east_hall_corner"]
}

@onready var timer: Timer = Timer.new()
@onready var right_door: Area2D = $"../../OfficeElements/Office/Doors/RightDoor"


func _ready() -> void:
	add_child(timer)
	timer.wait_time = WAIT_TIME
	timer.autostart = true
	timer.connect("timeout", _mov_opportunity)
	timer.start()

func _mov_opportunity() -> void:
	if lvl_ai >= randi_range(1, 20):
		var options = CONNECTIONS[pos]
		pos = options.pick_random()
		
		if pos == "right_door":
			await get_tree().create_timer(JUMPSCARE_TIME).timeout
			if not right_door.is_close:
				print("jumpscare!")
				get_tree().quit()
