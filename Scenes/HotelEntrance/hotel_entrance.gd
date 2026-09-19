extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_go_hotel_mouse_entered() -> void:
	$"40".visible = true # Replace with function body.

func _on_go_hotel_mouse_exited() -> void:
	$"40".visible = false # Replace with function body.

func _on_go_hotel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			SceneTransition.transition_fade("res://Scenes/HotelFrontDesk/FrontDesk.tscn")
			await SceneTransition.on_transition_finished
			queue_free()


func _on_go_back_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			SceneTransition.transition_fade("res://Scenes/Hotel Exterior/HtExterior.tscn")
			await SceneTransition.on_transition_finished
			queue_free()


func _on_go_back_mouse_entered() -> void:
	$"27".visible = true # Replace with function body.


func _on_go_back_mouse_exited() -> void:
	$"27".visible = false # Replace with function body.
