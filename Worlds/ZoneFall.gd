extends Area2D

# Detecta si el jugador ha caído en una zona de caída
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		print("Caiste")
		get_tree().reload_current_scene()
