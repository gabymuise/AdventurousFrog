extends Control


func _ready():
	visible = false  # Inicialmente oculto

# Manejar la pausa del juego
func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()  # Alternar pausa al recibir el evento de pausa

# Alternar pausa
func toggle_pause():
	get_tree().paused = not get_tree().paused  # Cambia el estado de pausa
	visible = get_tree().paused  # Muestra/oculta el menú de pausa basado en el estado

# Continuar el juego
func _on_start_pressed():
	toggle_pause()  # Vuelve a alternar el estado de pausa al presionar el botón de continuar

# Salir al menú principal y limpiar la pila de escenas
func _on_exit_pressed():
	toggle_pause()  # Alternar pausa antes de salir
	PilaScene.scene_stack.clear()  # Limpia la pila de escenas
	AudioManager.play_menu_music()  # Reproduce la música del menú
	scene_changer.change_scene("res://Main/SceneMenu/Menu.tscn")  # Cambia a la escena del menú principal
