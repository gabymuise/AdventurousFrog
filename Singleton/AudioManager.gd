extends Node

# Variable que almacena el reproductor de música de fondo.
var background_music : AudioStreamPlayer = null  

# Este método se ejecuta al iniciar el nodo. Crea un reproductor de música y lo agrega como hijo del nodo.
func _ready():
	background_music = AudioStreamPlayer.new()
	add_child(background_music)
	play_menu_music()  # Reproducir la música del menú al inicio

# Reproduce la música del menú.
func play_menu_music():
	stop_current_music()  # Detener cualquier música en reproducción.
	var menu_music = preload("res://Sounds/Intense.mp3")  # Carga la música del menú.
	background_music.stream = menu_music
	background_music.play()

# Reproduce la música del nivel.
func play_level_music():
	stop_current_music()  # Detener cualquier música en reproducción.
	var level_music = preload("res://Sounds/Peaceful Place.mp3")  # Carga la música del nivel.
	background_music.stream = level_music
	background_music.play()

# Detiene la música que está sonando actualmente.
func stop_current_music():
	if background_music.playing:
		background_music.stop()  # Detener la música actual.
