extends Node

var scene_stack : Array = []  # Pila para almacenar las escenas
var scene_changer = preload("res://Singleton/SceneChanger.gd").new()

func _ready():
	add_child(scene_changer)

# Añade una escena a la pila
func push_scene(scene_path: String) -> void:
	scene_stack.append(scene_path)  # Agrega la ruta de la escena a la pila
	print("Scene pushed: ", scene_path)  # Debug

# Elimina la última escena de la pila y la retorna
func pop_scene() -> String:
	return scene_stack.pop_back() if scene_stack.size() > 0 else ""  # Retorna la última escena, o una cadena vacía si la pila está vacía

# Limpia la pila de escenas
func clear_stack() -> void:
	scene_stack.clear()  # Limpia la pila
	print("Scene stack cleared.")  # Debug

# Manejador para regresar a la escena anterior
func _on_Back_pressed():
	var previous_scene = pop_scene()  # Obtiene la escena anterior de la pila
	if previous_scene != "":
		print("Returning to previous scene: ", previous_scene)  # Debug
		scene_changer.change_scene(previous_scene)  # Cambia a la escena anterior
	else:
		print("No previous scene found, returning to menu.")  # Debug
		scene_changer.change_scene("res://Main/SceneMenu/Menu.tscn")  # Si no hay escena anterior, vuelve al menú principal

