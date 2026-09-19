extends Control

@onready var version = $Version
@onready var fade: ColorRect = $CanvasLayer/ColorRect
var vnumb: String = "Alpha 0.1.55"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	version.text = vnumb + ". All Rights Reserved to Big Fish Games, BFG Entertainment and Raven Team."
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	$PLAY.disabled = true
	SceneTransition.transition_black()
	await SceneTransition.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Hotel Exterior/HtExterior.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
