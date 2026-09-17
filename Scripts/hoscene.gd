extends Node2D

@onready var item_list_container = $ColorRect/GridContainer # Container = node2d
@onready var obj_r = $ObjectPrompt/ObjName
@onready var obj_i = $ObjectPrompt/ObjIm
signal finished(state: bool)
var required_items: Array[String] = ["Fan", "Vacuum"] # Have to change it for each instance
var final_item: String = "Fan"

func _ready():
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect, "modulate:a", 0.0, 0.5)
	# Populate the HUD checklist
	for item in required_items: # Understandable
		var lbl = Label.new() # OH SO THIS IS WHAT DOES IT
		lbl.text = item # Makes sense
		lbl.name = item # Name it for easy lookup later
		item_list_container.add_child(lbl) # This is oddly easy
		
	# Dynamically connect signals from your hidden object nodes
	for child in get_children():
		if child.has_signal("object_found"): # OH! So the signal we made earlier is what makes this work.
			child.object_found.connect(_on_item_collected)

func _on_item_collected(collected_name: String):
	var sound_to: int = randi_range(1,3)
	if sound_to == 1:
		$AudioStreamPlayer.stream = load("res://Sounds/findItem1.mp3")
		$AudioStreamPlayer.play()
	elif sound_to == 2:
		$AudioStreamPlayer.stream = load("res://Sounds/findItem2.mp3")
		$AudioStreamPlayer.play()
	elif sound_to == 3:
		$AudioStreamPlayer.stream = load("res://Sounds/findItem3.mp3")
		$AudioStreamPlayer.play()
	else:
		print("This is impossible.")
	
	if collected_name in required_items:
		required_items.erase(collected_name)
		
		# Strike out or remove the item from the HUD checklist
		var hud_label = item_list_container.get_node(collected_name)
		if hud_label:
			hud_label.modulate = Color(0.5, 0.5, 0.5, 0.5) # Dim out text
			
			
		_check_victory_condition()

func _check_victory_condition():
	if required_items.is_empty():
		print("Scene Cleaned! Rewarding player with key item.")
		$ObjectPrompt.visible = true
		obj_r.text = final_item
		obj_i.texture = load("res://Scenes/Bedroom/Objects/Fan.png")
		await get_tree().create_timer(5.0).timeout
		finished.emit(true)
		get_tree().change_scene_to_file("res://Scenes/HotelFrontDesk/FrontDesk.tscn")
		# Trigger transition back to main map or hand over inventory evidence
