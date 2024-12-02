extends Node

# Variables para almacenar configuraciones
var fullscreen: bool = false  # Estado de pantalla completa
var borderless: bool = false  # Estado de ventana sin bordes

# Cargar configuraciones guardadas (si existen)
func _ready():
	load_settings()  # Llama a la función para cargar configuraciones al iniciar

# Guardar configuraciones en un archivo
func save_settings():
	var config = ConfigFile.new()  # Crear un nuevo objeto de configuración
	# Establecer valores en la configuración
	config.set_value("Display", "fullscreen", fullscreen)
	config.set_value("Display", "borderless", borderless)
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
		apply_settings()  # Aplicar configuraciones cargadas
		print("Configuración cargada.")  # Debug
	else:
		print("No se encontró el archivo de configuración. Usando valores predeterminados.")  # Debug

# Aplicar las configuraciones cargadas o predeterminadas
func apply_settings():
	OS.window_fullscreen = fullscreen  # Configurar pantalla completa
	OS.window_borderless = borderless  # Configurar ventana sin bordes
	print("Configuraciones aplicadas.")  # Debug
