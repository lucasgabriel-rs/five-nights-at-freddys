extends Node

# Night Counter
var night: int

# Doors
var leftDoor: bool
var rightDoor: bool = false

# Jumpscare Set-up
var jumpscare = false
var scarenow = false

# The Gang Set-ups
var steps = 0
var canJump = ""
var breaths = [1, 2, 3, 4].pick_random()
var brokeLeft = false
var brokeRight = false

# Misc
var currentCam = "stage"
var cameraUp = false
var gameOver = false
var restart = false

# Animatronics
var animatronics: Dictionary = {
	"bonnie": {
		"difficult": [0, # Night 1
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
		"difficult": [0, # Night 1
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
		"difficult": [0, # Night 1
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
	if jumpscare == false and gameOver == false:
		if brokeLeft == true or brokeRight == true:
			if cameraUp: jumpscare = true
			if jumpscare and !cameraUp: scarenow = true
	if Input.is_action_just_pressed("ui_down"):
		reset()


func reset():
		brokeLeft = false
		brokeRight = false
		jumpscare = false
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
			"foxy":
				match animatronics["foxy"]["pos"]:
					"pirate cove": 
						if !cameraUp:
							steps+=1
							if steps >= 4: 
								animatronics["foxy"]["pos"] = "west hall corner"
								steps = 0
					"west hall corner":
						if leftDoor: animatronics["foxy"]["pos"] = "pirate cove"
						else: 
							canJump = "foxy"
							scarenow = true
							jumpscare = true
			"freddy":
				match animatronics["freddy"]["pos"]:
					"dining area": animatronics["freddy"]["pos"] = ["east hall corner", "kitchen", "restroom"].pick_random()
					"restroom": animatronics["freddy"]["pos"] = ["east hall corner", "kitchen", "dining area"].pick_random()
					"kitchen": animatronics["freddy"]["pos"] = ["east hall corner", "restroom", "dining area"].pick_random()
					"east hall corner": animatronics["freddy"]["pos"] = "east hall"
					"east hall":
						if rightDoor == true: animatronics["freddy"]["pos"] = "dining area"
						else: 
							if cameraUp and currentCam == "East Hall": pass
							elif animatronics["chica"]["pos"] == "east hall": pass
							else:
								canJump = "freddy"
								jumpscare = true
								scarenow = true 
					_: animatronics["freddy"]["pos"] = ["dining area", "restroom", "kitchen"].pick_random()
