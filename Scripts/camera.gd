extends Node2D

@onready var camera: Camera2D = $CamPan
var mouseOn: String = "null"
const right: int = 448
func _ready() -> void:
	# Left
	$Left.connect("mouse_entered", leftEntered)
	$Left2.connect("mouse_entered", leftEnteredTwo)
	$Left3.connect("mouse_entered", leftEnteredThree)
	
	$Left.connect("mouse_exited", mouseExited)
	
	# Right
	$Right.connect("mouse_entered", rightEntered)
	$Right2.connect("mouse_entered", rightEnteredTwo)
	$Right3.connect("mouse_entered", rightEnteredThree)
	
	$Right.connect("mouse_exited", mouseExited)

func _process(_delta: float) -> void:
	match mouseOn:
		# Left
		"left": if camera.position.x > 0: camera.position.x -= 20
		"left 2": if camera.position.x > 0: camera.position.x -= 10
		"left 3": if camera.position.x > 0: camera.position.x -= 5
		
		# Right
		"right": if camera.position.x < right: camera.position.x += 20
		"right 2": if camera.position.x < right: camera.position.x += 10
		"right 3": if camera.position.x < right: camera.position.x += 5
	
	if camera.position.x < 0: camera.position.x = 0
	if camera.position.x > 448: camera.position.x = 448

# Left	
func leftEntered(): mouseOn = "left"
func leftEnteredTwo(): mouseOn = "left 2"
func leftEnteredThree(): mouseOn = "left 3"

# Right
func rightEntered(): mouseOn = "right"
func rightEnteredTwo(): mouseOn = "right 2"
func rightEnteredThree(): mouseOn = "right 3"

func mouseExited(): mouseOn = "null"
