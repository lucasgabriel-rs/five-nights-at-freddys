extends Node

# Night Counter
var night: int

# Doors
var leftDoor: bool
var rightDoor: bool

# Jumpscare
var jumpscare = false
var onDoor = false

# Animatronics
var animatronics: Dictionary = {
	"bonnie": {
		"difficult": [20, # Night 1
		0, # Night 2
		0, # Night 3
		0, # Night 4
		0, # Night 5
		0, # Night 6
		0 # Night 7
		],
		"pos": "stage"
	},
	"chica": {
		"difficult": [20, # Night 1
		0, # Night 2
		0, # Night 3
		0, # Night 4
		0, # Night 5
		0, # Night 6
		0 # Night 7
		],
		"pos": "stage"
	},
	"freddy": {
		"difficult": [20, # Night 1
		0, # Night 2
		0, # Night 3
		0, # Night 4
		0, # Night 5
		0, # Night 6
		0 # Night 7
		],
		"pos": "stage"
	},
	"foxy": {
		"difficult": [20, # Night 1
		0, # Night 2
		0, # Night 3
		0, # Night 4
		0, # Night 5
		0, # Night 6
		0 # Night 7
		],
		"pos": "pirate cove"
	}
}

func animatronicPos(x: String):
	return animatronics[x]["pos"]

func ai(n: String) -> void:
	if animatronics[n]["difficult"][night] >= randi_range(1, 20):
		match n:
			"bonnie":
				match animatronics[n]["pos"]:
					"dining area": animatronics["bonnie"]["pos"] = ["west hall corner", "backstage"].pick_random()
					"backstage": animatronics["bonnie"]["pos"] = ["dining area", "west hall corner"].pick_random()
					"west hall corner": animatronics["bonnie"]["pos"] = ["dining area", "supply room", "west hall"].pick_random()
					"supply room": animatronics["bonnie"]["pos"] = ["west hall corner", "west hall"].pick_random()
					"west hall": animatronics["bonnie"]["pos"] = ["west hall corner", "supply room", "door"].pick_random()
					"door": if leftDoor == true: animatronics["bonnie"]["pos"] = "dining area"
					_: animatronics["bonnie"]["pos"] = ["dining area", "backstage"].pick_random()
			"chica":
				match animatronics["chica"]["pos"][night]:
					"dining area": animatronics["chica"]["pos"] = ["kitchen", "restroom", "east hall corner"].pick_random()
					"restroom": animatronics["chica"]["pos"] = ["dining area", "kitchen"].pick_random()
					"kitchen": animatronics["chica"]["pos"] = ["restroom", "dining area", "east hall corner"].pick_random()
					"east hall corner": animatronics["chica"]["pos"] = ["east hall", "dining area", "kitchen"].pick_random()
					"east hall": animatronics["chica"]["pos"] = ["east hall corner", "door"].pick_random()
					"door": if rightDoor == true: animatronics["chica"]["pos"] = "dining area"
					_: animatronics["chica"]["pos"] = ["dining area", "restroom"].pick_random()
