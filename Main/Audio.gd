extends Control

func _ready():
	visible = true

# Ajustar el volumen del bus de audio
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

# Responder a cambios de volumen en diferentes buses
func _on_Master_value_changed(value):
	volume(0, value)

func _on_Music_value_changed(value):
	volume(1, value)

func _on_SoundFx_value_changed(value):
	volume(2, value)

# Volver a la escena anterior utilizando PilaScene
func _on_BackAudio_pressed():
	if PilaScene.scene_stack.size() > 0:
		print("Returning to previous scene: ", PilaScene.scene_stack.back())
		get_tree().change_scene(PilaScene.pop_scene())
	else:
		print("No previous scene found, returning to settings.")
		get_tree().change_scene("res://Main/Setting.tscn")
