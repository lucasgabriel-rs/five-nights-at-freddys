extends Node

@export_range(0, 20) var bonnie_ai: int
@export_range(0, 20) var chica_ai: int
@export_range(0, 20) var freddy_ai: int
@export_range(0, 20) var foxy_ai: int

@onready var bonnie: Node = $Bonnie
@onready var chica: Node = $Chica
@onready var freddy: Node = $Freddy
@onready var foxy: Node = $Foxy


func _ready() -> void:
	bonnie.lvl_ai = bonnie_ai
	chica.lvl_ai = chica_ai
