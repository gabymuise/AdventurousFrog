extends Node

# Ruta del archivo donde se guardan los datos de las monedas.
const COIN_FILEPATH = "user://coins.data"

# Variables de control de las monedas y niveles.
var total_coins = 0       # Total de monedas recolectadas a través de niveles.
var level_coins = 0       # Monedas recolectadas en el nivel actual.
var current_level = 1     # Nivel actual.

# Agregar monedas en el nivel actual.
func add_coin(amount: int = 1) -> void:
	level_coins += amount
	print("Monedas recolectadas en el nivel ", current_level, ": ", level_coins)

# Obtener el total de monedas recolectadas (suma de todas las monedas).
func get_total_coins() -> int:
	return total_coins + level_coins

# Reiniciar las monedas del nivel actual.
func reset_level_coins() -> void:
	level_coins = 0
	print("Monedas reiniciadas en el nivel ", current_level, ": ", level_coins)

# Lógica al completar un nivel.
func level_completed() -> void:
	total_coins += level_coins
	print("Nivel ", current_level, " completado. Monedas totales: ", total_coins)
	# Reiniciar las monedas del nivel y pasar al siguiente.
	level_coins = 0
	current_level += 1
	_update_file()  # Guardar los datos en archivo.

# Cargar los datos de monedas desde el archivo.
func load_coins_data() -> void:
	var coin_data = _load_file(COIN_FILEPATH)
	if coin_data.has("coins") and coin_data.has("level"):
		total_coins = coin_data["coins"]
		current_level = coin_data["level"]
		print("Datos cargados. Monedas: ", total_coins, " Nivel actual: ", current_level)
	else:
		print("No se encontraron datos o los datos son inválidos. Comenzando con 0 monedas.")
		_update_file()  # Crear un archivo con valores iniciales.

# Actualizar el archivo con los datos actuales de monedas y nivel.
func _update_file() -> void:
	var coin_data = { "coins": total_coins, "level": current_level }
	_save_file(COIN_FILEPATH, coin_data)

# Reiniciar las monedas del nivel al morir el jugador.
func on_player_death() -> void:
	reset_level_coins()

# Guardar los datos en un archivo.
func _save_file(filepath: String, data: Dictionary) -> void:
	var file = File.new()
	if file.open(filepath, File.WRITE) == OK:
		file.store_var(data)
		file.close()
	else:
		print("Error: No se pudo guardar el archivo en ", filepath)

# Cargar los datos desde un archivo.
func _load_file(filepath: String) -> Dictionary:
	var file = File.new()
	if file.file_exists(filepath):
		if file.open(filepath, File.READ) == OK:
			var data = file.get_var()
			file.close()
			return data
		else:
			print("Error: No se pudo leer el archivo en ", filepath)
			return {}
	else:
		print("El archivo no existe: ", filepath)
		return {}
