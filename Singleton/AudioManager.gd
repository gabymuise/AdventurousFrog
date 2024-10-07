extends Node

var background_music : AudioStreamPlayer = null  

func _ready():
	background_music = AudioStreamPlayer.new()
	add_child(background_music)
	play_menu_music()  # Reproducir la música del menú al inicio

# Reproducir música del menú
func play_menu_music():
	stop_current_music()  # Detener cualquier música en reproducción
	var menu_music = preload("res://Sounds/Intense.mp3")  
	background_music.stream = menu_music
	background_music.play()

# Reproducir música del nivel
func play_level_music():
	stop_current_music()  
	var level_music = preload("res://Sounds/Peaceful Place.mp3")  
	background_music.stream = level_music
	background_music.play()

# Detener la música actual
func stop_current_music():
	if background_music.playing:
		background_music.stop()  # Detener la música actual
