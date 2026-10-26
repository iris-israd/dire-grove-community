extends Node2D

var state_up = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interactor: ColorRect = $Inventory/Interactor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("hide")
	state_up = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if state_up == true:
		interactor.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://BaseUI/DiaryScreen.tscn")
	
func _on_interactor_mouse_entered() -> void:
	animation_player.play("show")
	state_up = true
	await get_tree().create_timer(5.0).timeout
	animation_player.play("hide")
	state_up = false
