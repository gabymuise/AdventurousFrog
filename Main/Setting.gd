extends Control

onready var setting = $Setting

func _ready():
	visible = true

func _on_Video_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename)
	print("Previous scene set to: ", get_tree().current_scene.filename)  # Depuración
	get_tree().change_scene("res://Main/Video.tscn")

func _on_Audio_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename)
	print("Previous scene set to: ", get_tree().current_scene.filename)  # Depuración
	get_tree().change_scene("res://Main/Audio.tscn")

func _on_Back_pressed():
	PilaScene._on_Back_pressed()

