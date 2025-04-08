extends Node2D

@onready var supply_room: AnimatedSprite2D = $"UI/Supply Room"


func _on_cam_1a_pressed() -> void:
	$Stage.visible = true
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_1b_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = true
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_1c_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = true
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_2a_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = true
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_2b_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = true
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_3_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = true
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_4a_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = true
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_4b_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = true
	$Kitchen.visible = false

func _on_cam_5_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = true
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false

func _on_cam_6_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = false
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = true

func _on_cam_7_pressed() -> void:
	$Stage.visible = false
	$"Dining Area".visible = false
	$"Pirate Cove".visible = false
	$Restrooms.visible = true
	$Backstage.visible = false
	$"West Hall Corner".visible = false
	$"East Hall Corner".visible = false
	supply_room.visible = false
	$"West Hall".visible = false
	$"East Hall".visible = false
	$Kitchen.visible = false
