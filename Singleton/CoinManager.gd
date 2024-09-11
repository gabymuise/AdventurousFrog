extends Node

var total_coins = 0

# Función para agregar una moneda
func add_coin():
	total_coins += 1
	print("Total coins: ", total_coins)

# Función para obtener la cantidad de monedas actuales
func get_total_coins() -> int:
	return total_coins

# Función para reiniciar las monedas recolectadas
func reset_coins():
	total_coins = 0
	print("Coins reset to: ", total_coins)
