extends Area2D

signal coinCollected

func _ready():
	connect("body_entered", self, "_on_Coin2D_body_entered")

func _on_Coin2D_body_entered(body):
	if body.get_name() == "Player":
		# Añadir una moneda al CoinManager y actualizar al jugador
		CoinManager.add_coin()
		body.add_Coin()
		emit_signal("coinCollected")
		queue_free()
