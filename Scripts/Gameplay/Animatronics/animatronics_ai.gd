extends Node

@export_range(0, 20) var bonnie_ai
@onready var bonnie: Node = $Bonnie

func _ready() -> void:
	bonnie.lvl_ai = bonnie_ai
