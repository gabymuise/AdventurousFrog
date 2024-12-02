extends Area2D

# Señal que se emite cuando se recoge la moneda.
signal coinCollected

# Valor de la moneda 
var coin_value : int = 1

# Se ejecuta cuando la escena está lista.
func _ready():
	pass

# Maneja la colisión con otros cuerpos.
func _on_Coin2D_body_entered(body):
	# Verifica si el cuerpo que colisiona es el jugador.
	if body.get_name() == "Player":
		$"../PickupSound".play()  # Reproduce el sonido de recogida de la moneda.
		CoinManager.add_coin(coin_value)  # Agrega el valor de la moneda al CoinManager.
		body.add_Coin()  # Llama al método del jugador para actualizar su conteo de monedas.
		emit_signal("coinCollected")  # Emite la señal indicando que la moneda ha sido recogida.
		queue_free()  # Destruye la moneda.
