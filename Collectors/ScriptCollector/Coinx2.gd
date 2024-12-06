extends "res://Collectors/ScriptCollector/Coin2D.gd" 

# Se ejecuta cuando la escena está lista.
func _ready():
	pass

# Maneja la entrada del cuerpo en el área de la moneda.
func _on_Coin2D_body_entered(body):
	# Verifica si el cuerpo que entra en contacto es el jugador.
	if body.get_name() == "Player":
		$"../PickupSound".play()  # Reproduce el sonido al recoger la moneda.
		CoinManager.add_coin(coin_value * 2)  # Agrega el doble del valor de la moneda al contador global.
		body.add_Coin()  # Ejecuta la lógica para incrementar el conteo de monedas del jugador.
		emit_signal("coinCollected")  # Emite la señal indicando que la moneda fue recogida.
		queue_free()  # Elimina la instancia de la moneda.
