extends Control

onready var setting = $Setting

func _ready():
	visible = true

func _on_Video_pressed():
	get_tree().change_scene("res://Main/Video.tscn")

func _on_Audio_pressed():
	get_tree().change_scene("res://Main/Audio.tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://Main/Menu.tscn")
