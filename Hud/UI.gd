extends CanvasLayer

func _ready():
	# Muestra la cantidad inicial de monedas
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())
	# Conectar señales de monedas después de un pequeño retraso para asegurarse de que están disponibles
	call_deferred("_connect_coin_signals")

func _connect_coin_signals():
	# Encuentra todas las monedas en la escena y conéctalas al HUD
	for coin in get_tree().get_nodes_in_group("Coins"):
		coin.connect("coinCollected", self, "handleCoinCollected")

func handleCoinCollected():
	print("coin collected")
	# Actualiza el texto del HUD con la cantidad actual de monedas
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())
