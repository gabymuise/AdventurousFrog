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
	if PilaScene.scene_stack.size() > 0:
		print("Returning to previous scene: ", PilaScene.scene_stack.back())  # Depuración
		get_tree().change_scene(PilaScene.pop_scene())
	else:
		print("No previous scene found, returning to settings.")  # Depuración
		get_tree().change_scene("res://Main/Setting.tscn")
