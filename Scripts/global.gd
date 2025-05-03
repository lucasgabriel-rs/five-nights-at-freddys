extends Node

# Night Counter
var night: int

# Doors
var leftDoor: bool
var rightDoor: bool

# Jumpscare
var jumpscare = false
var brokeLeft = false
var brokeRight = false
var cameraUp = false
var scarenow = false
var gameOver = false
var restart = false
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

func _process(delta: float) -> void:
	if scarenow == false and gameOver == false:
		if brokeLeft == true or brokeRight == true:
			if cameraUp:
				jumpscare = true
			if jumpscare == true and !cameraUp:
				scarenow = true
	if Input.is_action_just_pressed("ui_down"):
		reset()


func reset():
		brokeLeft = false
		brokeRight = false
		jumpscare = false
		scarenow = false
		gameOver = false
		#Imaginary Match animatronics
		animatronics["bonnie"]["pos"] = "stage"
		animatronics["chica"]["pos"] = "stage"
		animatronics["freddy"]["pos"] = "stage"
		animatronics["foxy"]["pos"] = "pirate cove"


func animatronicPos(x: String):
	return animatronics[x]["pos"]

func ai(n: String) -> void:
	if animatronics[n]["difficult"][night] >= randi_range(1, 20):
		match n:
			"bonnie":
				match animatronics["bonnie"]["pos"]:
					"dining area": animatronics["bonnie"]["pos"] = ["west hall corner", "backstage"].pick_random()
					"backstage": animatronics["bonnie"]["pos"] = ["west hall corner", "dining area"].pick_random()
					"west hall corner": animatronics["bonnie"]["pos"] = ["west hall", "supply room", "dining area", "backstage"].pick_random()
					"supply room": animatronics["bonnie"]["pos"] = ["west hall", "west hall corner"].pick_random()
					"west hall": animatronics["bonnie"]["pos"] = ["door", "supply room", "west hall corner"].pick_random()
					"door": 
						if leftDoor == true: 
							animatronics["bonnie"]["pos"] = "dining area"
							brokeLeft = false
						else:
							brokeLeft = true
					_: animatronics["bonnie"]["pos"] = ["dining area", "backstage"].pick_random()
			"chica":
				match animatronics["chica"]["pos"]:
					"dining area": animatronics["chica"]["pos"] = ["east hall corner", "kitchen", "restroom"].pick_random()
					"restroom": animatronics["chica"]["pos"] = ["east hall corner", "kitchen", "dining area"].pick_random()
					"east hall corner": animatronics["chica"]["pos"] = ["east hall", "kitchen", "dining area", "restroom"].pick_random()
					"kitchen": animatronics["chica"]["pos"] = ["east hall corner", "restroom", "dining area"].pick_random()
					"east hall": animatronics["chica"]["pos"] = ["door", "east hall corner"].pick_random()
					"door": 
						if rightDoor == true: animatronics["chica"]["pos"] = "dining area"
						else:
							brokeRight = true
					_: animatronics["chica"]["pos"] = ["dining area", "restroom"].pick_random()
