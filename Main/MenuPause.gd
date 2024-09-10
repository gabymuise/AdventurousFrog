# res://Main/MenuPause.gd
extends Control

onready var menu = $Menu  # Referencia al nodo del menú

func _ready():
	visible = false  # Inicialmente oculto

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
	# Guarda la escena actual antes de cambiar
	GlobalState.previous_scene = get_tree().current_scene.filename
	toggle_pause()
	get_tree().change_scene("res://Main/Setting.tscn")

func _on_exit_pressed():
	toggle_pause()
	GlobalState.previous_scene = ""  # Reinicia la escena anterior
	get_tree().change_scene("res://Main/Menu.tscn")

