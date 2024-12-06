extends Control

func _ready():
	visible = true  # Hace visible el control al iniciar

# Cambiar a la escena de video
func _on_Video_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename)  # Agrega la escena actual a la pila
	print("Escena anterior establecida en: ", get_tree().current_scene.filename)  # Debug
	scene_changer.change_scene("res://Main/SceneSetting/Video.tscn")  # Cambia a la escena de video

# Volver a la escena anterior utilizando PilaScene
func _on_Back_pressed():
	PilaScene._on_Back_pressed()  # Llama a la función para volver a la escena anterior

func _on_HowToPlay_pressed():
	PilaScene.push_scene(get_tree().current_scene.filename) 
	scene_changer.change_scene("res://Hud/SceneTeclas/HowToPlay.tscn")  # Cambia a la escena del menú principal
