extends Node2D

var state_up = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("hide")
	state_up = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if state_up == true:
		$Inventory/Interactor.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://BaseUI/DiaryScreen.tscn")
	
func _on_interactor_mouse_entered() -> void:
	$AnimationPlayer.play("show")
	state_up = true
	await get_tree().create_timer(5.0).timeout
	$AnimationPlayer.play("hide")
	state_up = false
