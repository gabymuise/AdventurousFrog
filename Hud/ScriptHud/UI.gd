extends CanvasLayer  # Hereda de CanvasLayer para superponer la interfaz sobre el juego

# Variables para gestionar la vida del jugador
var life = 3  # Número total de vidas
var current_health = life  # Salud actual del jugador, inicia igual a la vida

func _ready():
	# Llama a las funciones de actualización al iniciar
	update_coins()  # Actualiza la cantidad de monedas recogidas
	call_deferred("_connect_coin_signals")  # Conecta las señales de las monedas
	update_hearts()  # Actualiza la visualización de las vidas

# Conectar las señales de las monedas recogidas
func _connect_coin_signals():
	for coin in get_tree().get_nodes_in_group("Coins"):  # Itera sobre todas las monedas en el grupo "Coins"
		coin.connect("coinCollected", self, "update_coins")  # Conecta la señal de moneda recogida a la función update_coins

# Actualiza el texto que muestra la cantidad de monedas recogidas
func update_coins():
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())  # Actualiza el texto del nodo CoinsCollectedTxt

# Actualiza la visualización de las vidas del jugador
func update_hearts():
	for i in range(1, life + 1):  # Itera desde 1 hasta el número de vidas
		var heart_sprite = get_node("Heart" + str(i))  # Obtiene el nodo del corazón correspondiente
		if i <= current_health:  # Si la vida actual es mayor o igual al índice
			heart_sprite.play("full")  # Muestra el corazón lleno
		else:
			heart_sprite.play("empty")  # Muestra el corazón vacío

# Función para perder salud
func lose_health(damage_amount: int = 1):
	current_health = clamp(current_health - damage_amount, 0, life)  # Resta la cantidad de daño a la salud actual, asegurando que no sea menor que 0
	update_hearts()  # Actualiza la visualización de corazones
	if current_health == 0:  # Si la salud llega a 0
		print("El jugador ha muerto.")  # Mensaje de muerte del jugador
