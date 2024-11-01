extends Node

# Variables para almacenar configuraciones
var fullscreen: bool = false  # Estado de pantalla completa
var borderless: bool = false  # Estado de ventana sin bordes
var vsync_enabled: bool = true  # Habilitar sincronización vertical
var master_volume: float = 0  # Volumen master
var music_volume: float = 0  # Volumen de música
var sound_fx_volume: float = 0  # Volumen de efectos de sonido

# Cargar configuraciones guardadas (si existen)
func _ready():
	load_settings()  # Llama a la función para cargar configuraciones al iniciar

# Guardar configuraciones en un archivo
func save_settings():
	var config = ConfigFile.new()  # Crear un nuevo objeto de configuración
	# Establecer valores en la configuración
	config.set_value("Display", "fullscreen", fullscreen)
	config.set_value("Display", "borderless", borderless)
	config.set_value("Display", "vsync_enabled", vsync_enabled)
	config.set_value("Audio", "master_volume", master_volume)
	config.set_value("Audio", "music_volume", music_volume)
	config.set_value("Audio", "sound_fx_volume", sound_fx_volume)
	# Guardar el archivo de configuración
	config.save("user://settings.cfg")
	print("Configuración guardada.")  # Debug

# Cargar configuraciones desde el archivo
func load_settings():
	var config = ConfigFile.new()  # Crear un nuevo objeto de configuración
	var err = config.load("user://settings.cfg")  # Intentar cargar el archivo
	if err == OK:  # Si la carga fue exitosa
		# Obtener los valores de la configuración
		fullscreen = config.get_value("Display", "fullscreen", false)
		borderless = config.get_value("Display", "borderless", false)
		vsync_enabled = config.get_value("Display", "vsync_enabled", true)
		master_volume = config.get_value("Audio", "master_volume", 0)
		music_volume = config.get_value("Audio", "music_volume", 0)
		sound_fx_volume = config.get_value("Audio", "sound_fx_volume", 0)
		apply_settings()  # Aplicar configuraciones cargadas
		print("Configuración cargada.")  # Debug
	else:
		print("No se encontró el archivo de configuración. Usando valores predeterminados.")  # Debug

# Aplicar las configuraciones cargadas o predeterminadas
func apply_settings():
	OS.window_fullscreen = fullscreen  # Configurar pantalla completa
	OS.window_borderless = borderless  # Configurar ventana sin bordes
	OS.vsync_enabled = vsync_enabled  # Configurar sincronización vertical
	# Establecer los volúmenes en los buses de audio
	AudioServer.set_bus_volume_db(0, master_volume)  # Volumen maestro
	AudioServer.set_bus_volume_db(1, music_volume)  # Volumen de música
	AudioServer.set_bus_volume_db(2, sound_fx_volume)  # Volumen de efectos de sonido
	print("Configuraciones aplicadas.")  # Debug
