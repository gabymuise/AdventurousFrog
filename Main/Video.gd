extends Control

onready var video = $Video

func _ready():
	visible = true

func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed

func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed

func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed

func _on_BackVideo_pressed():
	# Cambia a la escena guardada usando PilaScene
	if PilaScene.scene_stack.size() > 0:
		print("Returning to previous scene: ", PilaScene.scene_stack.back())  # Depuración
		get_tree().change_scene(PilaScene.pop_scene())
	else:
		print("No previous scene found, returning to settings.")  # Depuración
		get_tree().change_scene("res://Main/Setting.tscn")
