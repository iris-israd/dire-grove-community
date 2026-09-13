extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 0.0, 0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_go_back_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var tween = create_tween()
			tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 1.0, 0.5)
			await tween.finished
			get_tree().change_scene_to_file("res://Scenes/HotelEntrance/HotelEntrance.tscn")


func _on_go_back_mouse_entered() -> void:
	$"27".visible = true


func _on_go_back_mouse_exited() -> void:
	$"27".visible = false


func _on_texture_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var tween = create_tween()
			tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 1.0, 0.5)
			await tween.finished
			get_tree().change_scene_to_file("res://Premades/hoscene.tscn")
