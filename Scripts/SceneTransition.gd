extends CanvasLayer

signal on_transition_finished

@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	color_rect.visible = false 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# Below function handles logic for fading in / fading out from a black screen.
func transition_black():
	color_rect.visible = true
	await create_tween().tween_property(color_rect, "modulate:a", 1, 0.5).finished
	on_transition_finished.emit()
	await create_tween().tween_property(color_rect, "modulate:a", 0, 0.5).finished
	color_rect.visible = false

# Below function handles logic for fading in to the clicked location scene.
func transition_fade(scene : String):
	color_rect.visible = true # This line of code is necessarily to prevent spam-clicking to avoid bugs
	var next_scene = load(scene).instantiate()
	next_scene.modulate.a = 0
	get_tree().root.add_child(next_scene)
	await create_tween().tween_property(next_scene, "modulate:a", 1, 0.5).finished
	on_transition_finished.emit()
	color_rect.visible = false # This line of code is necessarily to prevent spam-clicking to avoid bugs
