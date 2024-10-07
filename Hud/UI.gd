extends CanvasLayer

func _ready():
	# Mostrar el número inicial de monedas en el HUD
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())
	call_deferred("_connect_coin_signals")

func _connect_coin_signals():
	# Encontrar todas las monedas y conectar la señal al HUD
	for coin in get_tree().get_nodes_in_group("Coins"):
		coin.connect("coinCollected", self, "handleCoinCollected")

func handleCoinCollected():
	# Actualizar el HUD cuando se recolecta una moneda
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())
