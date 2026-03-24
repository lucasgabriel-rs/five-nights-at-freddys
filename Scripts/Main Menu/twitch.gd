extends TextureRect

const images = [
	"res://Assets/2-MENU_TWITCHING/1.png",
	"res://Assets/2-MENU_TWITCHING/2.png",
	"res://Assets/2-MENU_TWITCHING/3.png",
	"res://Assets/2-MENU_TWITCHING/4.png"
]

func _process(_delta: float) -> void:
	if randi_range(1, 20) > 19: self.texture = load(images[randi_range(1, 3)])
	else: self.texture = preload(images[0])
