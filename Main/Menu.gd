extends Control

func _on_Play_pressed():
	# Limpiar las monedas al iniciar una nueva partida
	CoinManager.reset_coins()
	# Cambiar a la escena principal del juego
	get_tree().change_scene("res://Worlds/Easy/World1.tscn")

func _on_Exit_pressed():
	# Salir del juego
	get_tree().quit()

func _on_Setting_pressed():
	# Abrir la escena de configuraciones
	get_tree().change_scene("res://Main/Setting.tscn")
