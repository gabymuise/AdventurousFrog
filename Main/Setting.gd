# res://Main/Setting.gd
extends Control

onready var setting = $Setting

func _ready():
	visible = true

func _on_Video_pressed():
	# Guarda la escena actual antes de cambiar
	GlobalState.previous_scene = get_tree().current_scene.filename
	get_tree().change_scene("res://Main/Video.tscn")

func _on_Audio_pressed():
	# Guarda la escena actual antes de cambiar
	GlobalState.previous_scene = get_tree().current_scene.filename
	get_tree().change_scene("res://Main/Audio.tscn")

func _on_Back_pressed():
	# Cambia a la escena guardada
	if GlobalState.previous_scene:
		get_tree().change_scene(GlobalState.previous_scene)
	else:
		# Si no hay escena guardada, vuelve al menú principal
		get_tree().change_scene("res://Main/Menu.tscn")
