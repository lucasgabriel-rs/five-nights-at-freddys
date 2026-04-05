extends Node

@onready var left_door: Area2D = %LeftDoor
@onready var timer: Timer = Timer.new()
@onready var cam_rooms: Node2D = %CamRooms

const INIT_POS: String = "stage"
const WAIT_TIME: float = 4.98
const JUMPSCARE_TIME: float = 4.98
const CONNECTIONS: Dictionary = {}

var pos: String = INIT_POS
var lvl_ai: float
