extends Node

var scene_stack : Array = []

func push_scene(scene_path: String) -> void:
	scene_stack.append(scene_path)
	print("Scene pushed: ", scene_path)  # Depuración

func pop_scene() -> String:
	if scene_stack.size() > 0:
		return scene_stack.pop_back()
	else:
		return ""

func clear_stack() -> void:
	scene_stack.clear()
	print("Scene stack cleared.")  # Depuración

func _on_Back_pressed():
	var previous_scene = pop_scene()
	if previous_scene != "":
		print("Returning to previous scene: ", previous_scene)  # Depuración
		get_tree().change_scene(previous_scene)
	else:
		print("No previous scene found, returning to menu.")  # Depuración
		get_tree().change_scene("res://Main/Menu.tscn")
