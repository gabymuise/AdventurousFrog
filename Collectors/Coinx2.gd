extends "res://Collectors/Coin2D.gd"

func _ready():
	pass  # Este método puede incluir lógica de inicialización si se necesita.

# Maneja la entrada del cuerpo en el área de la moneda.
func _on_Coin2D_body_entered(body):
	if body.get_name() == "Player":  # Verifica si el cuerpo es el jugador.
		$"../PickupSound".play()  # Reproduce el sonido de recogida de la moneda.
		CoinManager.add_coin(coin_value * 2)  # Agrega el doble del valor de la moneda al total.
		body.add_Coin()  # Ejecuta la lógica de aumento de moneda en el jugador.
		emit_signal("coinCollected")  # Emite la señal de que la moneda fue recolectada.
		queue_free()  # Elimina la instancia de la moneda.
