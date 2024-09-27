extends Area2D

signal coinCollected

# Valor por defecto de las monedas que otorga
var coin_value : int = 1

func _ready():
	connect("body_entered", self, "_on_Coin2D_body_entered")

func _on_Coin2D_body_entered(body):
	if body.get_name() == "Player":
		# Añadir una moneda (o la cantidad definida) al CoinManager y actualizar al jugador
		CoinManager.add_coin(coin_value)
		body.add_Coin()
		emit_signal("coinCollected")
		queue_free()
