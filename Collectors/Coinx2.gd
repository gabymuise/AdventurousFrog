extends "res://Collectors/Coin2D.gd"

func _ready():
	pass

func _on_Coin2D_body_entered(body):
	if body.get_name() == "Player":
		$"../PickupSound".play()
		CoinManager.add_coin(coin_value * 2)  # Sumar 2 monedas
		body.add_Coin()
		emit_signal("coinCollected")
		queue_free()
