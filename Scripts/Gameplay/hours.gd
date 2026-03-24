extends Label

@onready var time: Timer = $"../../Time"


func _process(_delta: float) -> void:
	var _hours = time.time
	
	if _hours > 0: text = "%s AM" % [str(_hours)]
	else: text = "12 AM"
