extends Control

onready var menu = $Menu  # Referencia al nodo del menú

func _ready():
	visible = false  


func _input(event):
	if event.is_action_pressed("pause"): 
		toggle_pause()


func toggle_pause():
	if get_tree().paused:
		get_tree().paused = false  # Reanudar el juego
		visible = false  # Ocultar el menú de pausa
	else:
		get_tree().paused = true  # Pausar el juego
		visible = true  # Mostrar el menú de pausa

func _on_start_pressed():
	toggle_pause()


func _on_settings_pressed():
	# Cargar la escena de Settings
	toggle_pause()
	get_tree().change_scene("res://Main/Setting.tscn")

# Salir del juego y volver al menú principal
func _on_exit_pressed():
	toggle_pause()
	get_tree().change_scene("res://Main/Menu.tscn")

