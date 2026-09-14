extends Node

var scene_history: Array[String] = []
var excluded_scenes: Array[String] = ["res://scenes/main_menu.tscn"]

# Define your main gameplay scene as a fallback
const FALLBACK_SCENE = "res://BaseUI/PlayerInterface.tscn"

func _ready() -> void:
	get_tree().node_added.connect(_on_node_added)

func _on_node_added(node: Node) -> void:
	if node == get_tree().current_scene:
		var current_path = node.scene_file_path
		if current_path != "" and not current_path in excluded_scenes:
			if scene_history.is_empty() or scene_history.back() != current_path:
				scene_history.append(current_path)

func go_back() -> void:
	# 1. Normal behavior: We have a history to step backward through
	if scene_history.size() >= 2:
		scene_history.pop_back() # Remove current scene
		var target_scene = scene_history.pop_back() # Get previous scene
		get_tree().change_scene_to_file(target_scene)
		
	# 2. Fallback behavior: History is empty or we are on the first scene
	else:
		# Clear whatever is left so history doesn't break
		scene_history.clear() 
		
		# Force change to the main gameplay screen
		get_tree().change_scene_to_file(FALLBACK_SCENE)
