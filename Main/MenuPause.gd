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

# Salir al menú principal y limpiar la pila de escenas
func _on_exit_pressed():
	toggle_pause()
	PilaScene.scene_stack.clear()
	AudioManager.play_menu_music() 
	get_tree().change_scene("res://Main/Menu.tscn")
