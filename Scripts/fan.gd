# Attach this script to your individual HiddenObject scenes
extends TextureButton

signal object_found(object_name)
@export var item_name: String = "Fan"

func _ready():
	# Connect button press to internal logic
	pressed.connect(_on_pressed)

func _on_pressed():
	# Emit signal to the main level manager, then delete the item
	object_found.emit(item_name)
	hide()
	queue_free()
