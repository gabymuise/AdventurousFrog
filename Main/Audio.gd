extends Control

onready var audio = $Audio

func _ready():
	visible = true

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_Master_value_changed(value):
	volume(0, value)

func _on_Music_value_changed(value):
	volume(1, value)

func _on_SoundFx_value_changed(value):
	volume(2, value)

func _on_BackAudio_pressed():
	get_tree().change_scene("res://Main/Setting.tscn")
