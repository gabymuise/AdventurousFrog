extends CanvasLayer

var coins = 0

func _ready():
	print("UI ready")
	$CoinsCollectedTxt.text = str(coins)

func handleCoinCollected():
	print("coin collected")
	coins += 1
	$CoinsCollectedTxt.text = str(coins)
