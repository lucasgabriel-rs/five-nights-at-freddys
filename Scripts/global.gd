extends Node

# Night Counter
var night: int

# Doors
var leftDoor: bool
var rightDoor: bool

# Animatronics
var animatronics: Dictionary = {
	"bonnie": {
		"difficult": [0, 0, 0, 0, 0],
		"pos": "stage"
	},
}

func animatronicPos(x: String):
	return animatronics[x]["pos"]

func ai(n: String) -> void:
	var difficult = animatronics[n]["difficult"][night]
	var dice = randi_range(1, 20)
	if difficult >= dice:
		match animatronics[n]["pos"]:
			"dining area": animatronics[n]["pos"] = ["west hall corner", "backstage"].pick_random()
			"backstage": animatronics[n]["pos"] = ["dining area", "west hall corner"].pick_random()
			"west hall corner": animatronics[n]["pos"] = ["dining area", "supply room", "west hall"].pick_random()
			"supply room": animatronics[n]["pos"] = ["west hall corner", "west hall"].pick_random()
			"west hall": animatronics[n]["pos"] = ["west hall corner", "supply room"].pick_random()
			"door": pass
			_: animatronics[n]["pos"] = ["dining area", "backstage"].pick_random()
	#print("Dice: ", dice,"\nPosition: ", animatronicPos(n))
