extends Node

# Objects.
@onready var left_door: Area2D = %LeftDoor
@onready var cam_rooms: Node2D = %CamRooms
@onready var timer: Timer = Timer.new()

# Constant parameters.
const INIT_POS: String = "stage"
const WAIT_TIME: float = 4.97
const JUMPSCARE_TIME: float = 5.0
const MIN_OPPORTUNITY: int = 1
const MAX_OPPORTUNITY: int = 20

# The path that Bonnie is capable of taking.
const CONNECTIONS: Dictionary = {
	"stage": ["dining_area", "backstage"],
	"dining_area": ["west_hall_corner"],
	"backstage": ["west_hall_corner"],
	"west_hall_corner": ["west_hall"],
	"supply_room": ["left_door"],
	"west_hall": ["left_door", "supply_room"],
	"left_door": ["dining_area"]
}

# Parameters.
var pos: String = INIT_POS
var lvl_ai: float


func _ready() -> void:
	# Timer configuration.
	add_child(timer)
	timer.wait_time = WAIT_TIME
	timer.autostart = true
	timer.connect("timeout", _mov_opportunity)
	timer.start()


# Function that defines Bonnie's movement opportunity.
func _mov_opportunity() -> void:
	if lvl_ai >= randi_range(MIN_OPPORTUNITY, MAX_OPPORTUNITY):
		var options = CONNECTIONS[pos]
		pos = options.pick_random()
		
		# If Bonnie's position is "left_door",
		# he will wait 5 seconds,
		# and if the time runs out and the door is open,
		# Bonnie will jumpscare the player!
		if pos == "left_door":
			await get_tree().create_timer(JUMPSCARE_TIME).timeout
			if not left_door.is_close:
				print("jumpscare!")
				get_tree().quit()
	
	# Call the CamRooms function to update the camera images.
	cam_rooms.update_cams()
