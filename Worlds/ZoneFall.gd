extends Area2D

# Detecta si el jugador ha caído en una zona de caída
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		print("Caíste en una zona de caída")
		CoinManager.on_player_death()  # Reinicia las monedas del nivel actual
		body._loseLife()  # Reinicia la escena actual (nivel)
