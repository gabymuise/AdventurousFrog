extends Control

onready var menu = $Menu
onready var setting = $Setting
onready var video = $Video
onready var audio = $Audio

func _on_Play_pressed():
	get_tree().change_scene("res://Worlds/World1.tscn")


func _on_Exit_pressed():
	get_tree().quit()


func _on_Setting_pressed():
	show_and_hide(setting,menu)

func show_and_hide(first, second):
	first.show()
	second.hide()


func _on_Video_pressed():
	show_and_hide(video, setting)


func _on_Audio_pressed():
	show_and_hide(audio, setting)


func _on_Back_pressed():
	show_and_hide(menu, setting)


func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Borderless_toggled(button_pressed):
	OS.window_borderless = button_pressed


func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed


func _on_BackVideo_pressed():
	show_and_hide(setting, video)

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_Master_value_changed(value):
	volume(0,value)


func _on_Music_value_changed(value):
	volume(2, value)


func _on_SoundFx_value_changed(value):
	volume(2, value)


func _on_BackAudio_pressed():
	show_and_hide(setting, audio)
