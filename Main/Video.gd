extends Control

func _ready():
	visible = true

# Configuración de pantalla completa, ventana sin bordes y VSync
func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed

func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed

func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed

# Volver a la escena anterior utilizando PilaScene
func _on_BackVideo_pressed():
	if PilaScene.scene_stack.size() > 0:
		print("Returning to previous scene: ", PilaScene.scene_stack.back())
		get_tree().change_scene(PilaScene.pop_scene())
	else:
		print("No previous scene found, returning to settings.")
		get_tree().change_scene("res://Main/Setting.tscn")
