extends Area2D  

# Llama a esta función cuando un cuerpo entra en el área
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):  # Verifica si el cuerpo pertenece al grupo "Players"
		print("Caíste en una zona de caída")  # Debug
		CoinManager.on_player_death()  # Reinicia las monedas del nivel actual
		body._loseLife()  # Llama a la función para perder una vida (puede reiniciar el nivel)
