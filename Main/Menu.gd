extends Control

onready var menu = $Menu

func _on_Play_pressed():
	# Cambiar a la escena principal del juego
	get_tree().change_scene("res://Worlds/World1.tscn")

func _on_Exit_pressed():
	# Salir del juego
	get_tree().quit()

func _on_Setting_pressed():
	# Cargar la escena de Settings
	get_tree().change_scene("res://Main/Setting.tscn")
