extends Control

onready var menu = $Menu
onready var setting = $Setting
onready var video = $Video
onready var audio = $Audio

func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pause"):
		toggle_pause()

func toggle_pause():
	if get_tree().paused:
		get_tree().paused = false
		visible = false
	else:
		get_tree().paused = true
		visible = true

func _on_start_pressed():
	toggle_pause()


func _on_settings_pressed():
	show_and_hide(setting,menu)


func _on_exit_pressed():
	toggle_pause()
	get_tree().change_scene("res://Main/Menu.tscn")


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


func _on_Master_value_changed(value):
	volume(0,value)

func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_Music_value_changed(value):
	volume(1, value)


func _on_SoundFx_value_changed(value):
	volume(2, value)


func _on_BackAudio_pressed():
	show_and_hide(setting, audio)
