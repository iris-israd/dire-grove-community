extends Node2D

@onready var quote = $Quotes/Label

func _ready() -> void:
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 0.0, 0.5)
	show_quote()

func show_quote() -> void:
	# Only play if this quote hasn't been shown yet
	if not Global.quote_seen["q1"]:
		Global.quote_seen["q1"] = true
		quote.text = "Once again in Dire Grove."
		
		var qtween = create_tween()
		# Fade in
		qtween.tween_property($Quotes, "modulate:a", 1.0, 0.5)
		# Wait 5 seconds
		qtween.tween_interval(5.0)
		# Fade out
		qtween.tween_property($Quotes, "modulate:a", 0.0, 0.5)
	else:
		# Keep quotes hidden if already seen
		$Quotes.modulate.a = 0.0

func _on_go_hotel_mouse_entered() -> void:
	$"40".visible = true

func _on_go_hotel_mouse_exited() -> void:
	$"40".visible = false

func _on_go_hotel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var tween = create_tween()
		tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 1.0, 0.5)
		await tween.finished
		get_tree().change_scene_to_file("res://Scenes/HotelEntrance/HotelEntrance.tscn")


func _on_fountain_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			quote.text = "This is frozen solid."
			
			var qtween = create_tween()
			# Fade in
			qtween.tween_property($Quotes, "modulate:a", 1.0, 0.5)
			# Wait 5 seconds
			qtween.tween_interval(5.0)
			# Fade out
			qtween.tween_property($Quotes, "modulate:a", 0.0, 0.5)
