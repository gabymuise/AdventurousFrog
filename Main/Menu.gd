extends Control

# Método llamado al presionar el botón "Play"
func _on_Play_pressed():
	CoinManager.reset_level_coins()  # Reinicia las monedas del nivel actual
	AudioManager.play_level_music()  # Llama a la música del nivel
	get_tree().change_scene("res://Worlds/Easy/World1.tscn")  # Cambia a la escena del primer nivel

# Método llamado al presionar el botón "Exit"
func _on_Exit_pressed():
	get_tree().quit()  # Cierra la aplicación

# Método llamado al presionar el botón "Setting"
func _on_Setting_pressed():
	# Abrir la escena de configuraciones
	var a = get_tree().change_scene("res://Main/Setting.tscn")  # Cambia a la escena de configuración
