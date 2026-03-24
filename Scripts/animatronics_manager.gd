extends Node


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


#func _process(_delta: float) -> void:
	#if hours == 2: animatronics["bonnie"]["bonus"] = 1
	#if hours == 3:
		#animatronics["bonnie"]["bonus"] = 2
		#animatronics["chica"]["bonus"] = 1
		#animatronics["foxy"]["bonus"] = 1
	#if hours >= 4:
		#animatronics["bonnie"]["bonus"] = 3
		#animatronics["chica"]["bonus"] = 2
		#animatronics["foxy"]["bonus"] = 2
