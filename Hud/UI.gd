extends CanvasLayer

# Referencia al botón TouchX
onready var touch_x_button = $Control/TouchX

func _ready():
	# Mostrar el número inicial de monedas en el HUD
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())
	call_deferred("_connect_coin_signals")
	
	# Conectar la señal del botón TouchX para manejar el evento de pulsación
	touch_x_button.connect("pressed", self, "_on_touch_x_pressed")

func _connect_coin_signals():
	# Encontrar todas las monedas y conectar la señal al HUD
	for coin in get_tree().get_nodes_in_group("Coins"):
		coin.connect("coinCollected", self, "handleCoinCollected")

func handleCoinCollected():
	# Actualizar el HUD cuando se recolecta una moneda
	$CoinsCollectedTxt.text = String(CoinManager.get_total_coins())

# Función que se llama cuando se presiona el botón TouchX
func _on_touch_x_pressed():
	# Cambiar de escena al menú principal
	AudioManager.play_menu_music() 
	get_tree().change_scene("res://Main/Menu.tscn")
