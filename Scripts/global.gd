extends Node

# Night Counter
var night: int = 0
var hours: int = 0

# Doors
var leftDoor: bool
var rightDoor: bool

# Jumpscare
var jumpscare = false
var onDoor = false

# Animatronics
var animatronics: Dictionary = {
	"freddy": {
		"difficult": [0, # Night 1
		0, # Night 2
		1, # Night 3
		randi_range(1, 2), # Night 4
		3, # Night 5
		0, # Night 6
		0 # Night 7
		],
		"pos": "stage",
		"isInStage": true
	},
	"bonnie": {
		"difficult": [0, # Night 1
		3, # Night 2
		6, # Night 3
		9, # Night 4
		12, # Night 5
		15, # Night 6
		0 # Night 7
		],
		"pos": "stage",
		"isInStage": true,
		"bonus": 0
	},
	"chica": {
		"difficult": [0, # Night 1
		2, # Night 2
		4, # Night 3
		6, # Night 4
		8, # Night 5
		10, # Night 6
		0 # Night 7
		],
		"pos": "stage",
		"isInStage": true,
		"bonus": 0
	},
	"foxy": {
		"difficult": [0, # Night 1
		2, # Night 2
		4, # Night 3
		6, # Night 4
		8, # Night 5
		10, # Night 6
		0 # Night 7
		],
		"pos": "pirate cove",
		"bonus": 0
	}
}

func _process(_delta: float) -> void:
	if hours == 2: animatronics["bonnie"]["bonus"] = 1
	if hours == 3:
		animatronics["bonnie"]["bonus"] = 2
		animatronics["chica"]["bonus"] = 1
		animatronics["foxy"]["bonus"] = 1
	if hours >= 4:
		animatronics["bonnie"]["bonus"] = 3
		animatronics["chica"]["bonus"] = 2
		animatronics["foxy"]["bonus"] = 2

func animatronicPos(n: String): return animatronics[n]["pos"]

func ai(n: String) -> void:
	if n != "freddy" and night != 6: animatronics[n]["difficult"][night] += animatronics[n]["bonus"]
	
	if animatronics[n]["difficult"][night] >= randi_range(1, 20):
		match n:
			"bonnie":
				match animatronics["bonnie"]["pos"]:
					"dining area":
						animatronics["bonnie"]["isInStage"] = false
						animatronics["bonnie"]["pos"] = ["west hall corner", "backstage"].pick_random()
					"backstage":
						animatronics["bonnie"]["isInStage"] = false
						animatronics["bonnie"]["pos"] = ["west hall corner", "dining area"].pick_random()
					"west hall corner":
						animatronics["bonnie"]["pos"] = ["west hall", "supply room", "dining area", "backstage"].pick_random()
					"supply room": animatronics["bonnie"]["pos"] = ["west hall", "west hall corner"].pick_random()
					"west hall":
						animatronics["bonnie"]["pos"] = ["door", "supply room", "west hall corner"].pick_random()
					"door": if leftDoor == true: animatronics["bonnie"]["pos"] = "dining area"
					_: animatronics["bonnie"]["pos"] = ["dining area", "backstage"].pick_random()
			"chica":
				match animatronics["chica"]["pos"]:
					"dining area":
						animatronics["chica"]["isInStage"] = false
						animatronics["chica"]["pos"] = ["east hall corner", "kitchen", "restroom"].pick_random()
					"restroom":
						animatronics["chica"]["isInStage"] = false
						animatronics["chica"]["pos"] = ["east hall corner", "kitchen", "dining area"].pick_random()
					"east hall corner":
						animatronics["chica"]["pos"] = ["east hall", "kitchen", "dining area", "restroom"].pick_random()
					"kitchen":
						animatronics["chica"]["pos"] = ["east hall corner", "restroom", "dining area"].pick_random()
					"east hall": animatronics["chica"]["pos"] = ["door", "east hall corner"].pick_random()
					"door": if rightDoor == true: animatronics["chica"]["pos"] = "dining area"
					_: animatronics["chica"]["pos"] = ["dining area", "restroom"].pick_random()
