extends Control  # Hereda de Control para crear un nodo de interfaz de usuario

func _ready():
	visible = true  # Asegura que el menú sea visible al iniciar

# Configuración de pantalla completa
func _on_FullScreen_toggled(button_pressed: bool):
	OS.window_fullscreen = button_pressed  # Cambia al modo de pantalla completa según el estado del botón

# Configuración de ventana sin bordes
func _on_Borderless_toggled(button_pressed: bool):
	OS.window_borderless = button_pressed  # Cambia al modo sin bordes según el estado del botón

# Volver a la escena anterior utilizando PilaScene
func _on_BackVideo_pressed():
	if PilaScene.scene_stack.size() > 0:  # Verifica si hay escenas en la pila
		print("Returning to previous scene: ", PilaScene.scene_stack.back())  # Muestra la escena anterior
		get_tree().change_scene(PilaScene.pop_scene())  # Cambia a la escena anterior
	else:
		print("No previous scene found, returning to settings.")  # Mensaje si no hay escena anterior
		get_tree().change_scene("res://Main/Setting.tscn")  # Regresa a la escena de configuración si no hay escena anterior
