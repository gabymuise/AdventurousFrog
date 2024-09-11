extends Control

func _ready():
	visible = true

# Guardar la escena actual y cambiar a la escena de video
func _on_Video_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename)
	print("Previous scene set to: ", get_tree().current_scene.filename)
	get_tree().change_scene("res://Main/Video.tscn")

# Guardar la escena actual y cambiar a la escena de audio
func _on_Audio_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename)
	print("Previous scene set to: ", get_tree().current_scene.filename)
	get_tree().change_scene("res://Main/Audio.tscn")

# Volver a la escena anterior utilizando PilaScene
func _on_Back_pressed():
	PilaScene._on_Back_pressed()
