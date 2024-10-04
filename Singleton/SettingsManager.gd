extends Node

var fullscreen: bool = false
var borderless: bool = false
var vsync_enabled: bool = true
var master_volume: float = 0
var music_volume: float = 0
var sound_fx_volume: float = 0

# Cargar configuraciones guardadas (si existen)
func _ready():
	load_settings()

# Guardar configuraciones en un archivo
func save_settings():
	var config = ConfigFile.new()
	config.set_value("Display", "fullscreen", fullscreen)
	config.set_value("Display", "borderless", borderless)
	config.set_value("Display", "vsync_enabled", vsync_enabled)
	config.set_value("Audio", "master_volume", master_volume)
	config.set_value("Audio", "music_volume", music_volume)
	config.set_value("Audio", "sound_fx_volume", sound_fx_volume)
	config.save("user://settings.cfg")
	print("Configuración guardada.")

# Cargar configuraciones desde el archivo
func load_settings():
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	if err == OK:
		fullscreen = config.get_value("Display", "fullscreen", false)
		borderless = config.get_value("Display", "borderless", false)
		vsync_enabled = config.get_value("Display", "vsync_enabled", true)
		master_volume = config.get_value("Audio", "master_volume", 0)
		music_volume = config.get_value("Audio", "music_volume", 0)
		sound_fx_volume = config.get_value("Audio", "sound_fx_volume", 0)
		apply_settings()
		print("Configuración cargada.")
	else:
		print("No se encontró el archivo de configuración. Usando valores predeterminados.")

# Aplicar las configuraciones cargadas o predeterminadas
func apply_settings():
	OS.window_fullscreen = fullscreen
	OS.window_borderless = borderless
	OS.vsync_enabled = vsync_enabled
	AudioServer.set_bus_volume_db(0, master_volume)
	AudioServer.set_bus_volume_db(1, music_volume)
	AudioServer.set_bus_volume_db(2, sound_fx_volume)
	print("Configuraciones aplicadas.")
