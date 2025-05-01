extends Node
# Night Counter
var night: int

# Doors
var leftDoor: bool
var rightDoor: bool

var jumpscare = false
var onDoor = false
# Animatronics
var animatronics: Dictionary = {
	"bonnie": {
		"difficult": 20,
		"pos": "stage"
	},
	"chica": {
		"difficult": 20,
		"pos": "stage"
	}
}

func animatronicPos(x: String):
	return animatronics[x]["pos"]

func ai(n: String) -> void:
	randomize()
	#var difficult = animatronics[n]["difficult"][night]
	var dice = randi_range(1, 20)
	if animatronics["bonnie"]["difficult"] >= dice:
			match animatronics["bonnie"]["pos"]:
				"dining area": animatronics["bonnie"]["pos"] = ["west hall corner", "backstage", "west hall"].pick_random()
				"backstage": animatronics["bonnie"]["pos"] = ["dining area", "west hall corner", "west hall"].pick_random()
				"west hall corner": animatronics["bonnie"]["pos"] = ["dining area", "supply room", "west hall"].pick_random()
				"supply room": animatronics["bonnie"]["pos"] = ["west hall corner", "west hall", "door"].pick_random()
				"west hall": animatronics["bonnie"]["pos"] = ["west hall corner", "supply room", "door"].pick_random()
				"door": 
					if leftDoor == true:
						animatronics["bonnie"]["pos"] = ["west hall", "stage", "supply room"].pick_random()
				_: animatronics["bonnie"]["pos"] = ["dining area", "backstage"].pick_random()
	if animatronics["chica"]["difficult"] >= dice:
		match animatronics["chica"]["pos"]:
			"stage": animatronics["chica"]["pos"] = ["dining area", "restroom", "kitchen"].pick_random()
			"dining area": animatronics["chica"]["pos"] = ["stage", "kitchen", "restroom", "east hall"].pick_random()
			"restroom": animatronics["chica"]["pos"] = ["dining area", "stage", "kitchen"].pick_random()
			"east hall": animatronics["chica"]["pos"] = ["east hall corner", "kitchen", "door", "dining area"].pick_random()		
			"east hall corner": animatronics["chica"]["pos"] = ["east hall", "dining area", "door"].pick_random()
			"kitchen": animatronics["chica"]["pos"] = ["east hall", "restroom", "dining area", "stage", "east hall corner"].pick_random()
			"door": 
				if rightDoor == true:
					animatronics["chica"]["pos"] = ["east hall", "kitchen", "stage", "dining area", "restroom"].pick_random()
	print("Chica","\nDice: ", dice,"\nPosition: ", animatronicPos("chica"))
	print("Bonnie", "\nDice: ", dice, "\nPosition: ", animatronicPos("bonnie"))
