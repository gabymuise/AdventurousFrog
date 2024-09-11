extends Area2D

signal coinCollected

func _ready():
	connect("body_entered", self, "_on_Coin2D_body_entered")

func _on_Coin2D_body_entered(body):
	if body.get_name() == "Player":
		body.add_Coin()
		CoinManager.add_coin()  # Añade la moneda al CoinManager
		emit_signal("coinCollected")
		queue_free()
