extends Node

var total_coins = 0

# Función para agregar monedas
# Si no se pasa ningún valor, sumará 1 moneda por defecto
func add_coin(amount: int = 1) -> void:
	total_coins += amount
	print("Total coins: ", total_coins)

# Función para obtener la cantidad de monedas actuales
func get_total_coins() -> int:
	return total_coins

# Función para reiniciar las monedas recolectadas
func reset_coins() -> void:
	total_coins = 0
	print("Coins reset to: ", total_coins)
