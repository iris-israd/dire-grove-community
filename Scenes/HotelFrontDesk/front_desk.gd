extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect to the global Event Bus instead of trying to look for a non-existent node
	EventBus.hop_finished.connect(_on_hop1_finished)

func _on_hop1_finished(state: bool) -> void:
	print("DEBUG: Hidden Object Scene Finished! State: ", state)
	# Disconnect after it runs once so it doesn't duplicate stack connections
	EventBus.hop_finished.disconnect(_on_hop1_finished) 
	
	if state == true:
		$TextureButton.visible = false
		$CPUParticles2D.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_go_back_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			SceneTransition.transition_fade("res://Scenes/HotelEntrance/HotelEntrance.tscn")
			await SceneTransition.on_transition_finished
			queue_free()


func _on_go_back_mouse_entered() -> void:
	$"27".visible = true


func _on_go_back_mouse_exited() -> void:
	$"27".visible = false


func _on_texture_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			SceneTransition.transition_fade("res://Premades/hoscene.tscn")
			await SceneTransition.on_transition_finished
			queue_free()
