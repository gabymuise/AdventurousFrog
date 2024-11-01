extends Control

# Asegura que el nodo sea visible.
func _ready():
	visible = true

# Ajusta el volumen del bus de audio.
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

# Ajusta el volumen del bus maestro.
func _on_Master_value_changed(value):
	volume(0, value)

# Ajusta el volumen del bus de música.
func _on_Music_value_changed(value):
	volume(1, value)

# Ajusta el volumen del bus de efectos.
func _on_SoundFx_value_changed(value):
	volume(2, value)

# Este método se ejecuta cuando se presiona el botón "BackAudio".
# Regresa a la escena anterior utilizando la pila de escenas "PilaScene".
# Si no hay escenas en la pila, vuelve a la escena de configuración.
func _on_BackAudio_pressed():
	if PilaScene.scene_stack.size() > 0:
		print("Returning to previous scene: ", PilaScene.scene_stack.back())
		get_tree().change_scene(PilaScene.pop_scene())
	else:
		print("No previous scene found, returning to settings.")
		get_tree().change_scene("res://Main/Setting.tscn")
