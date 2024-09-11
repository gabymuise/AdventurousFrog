extends Control

func _ready():
	visible = false  # Inicialmente oculto

# Manejar la pausa del juego
func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()

# Alternar pausa
func toggle_pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

# Continuar el juego
func _on_start_pressed():
	toggle_pause()

# Abrir configuraciones guardando la escena actual
func _on_settings_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename)
	toggle_pause()
	get_tree().change_scene("res://Main/Setting.tscn")

# Salir al menú principal y limpiar la pila de escenas
func _on_exit_pressed():
	toggle_pause()
	PilaScene.scene_stack.clear()
	get_tree().change_scene("res://Main/Menu.tscn")
