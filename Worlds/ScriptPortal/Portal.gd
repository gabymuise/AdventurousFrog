extends Node2D

export (String) var ruta_menu_principal = "res://Main/SceneMenu/Menu.tscn"  # Ruta de la escena del menú principal

func _on_Area2D_body_entered(cuerpo):
	if cuerpo.is_in_group("Players"):  # Verifica si el cuerpo pertenece al grupo "Players"
		var nivel_actual = get_parent()  # Obtiene la escena actual
		if nivel_actual.has_method("get_next_level"):  # Verifica si la escena tiene el método "get_next_level"
			var siguiente_nivel_escena = nivel_actual.get_next_level()  # Obtiene la escena del siguiente nivel
			if siguiente_nivel_escena != "" and ResourceLoader.exists(siguiente_nivel_escena):  # Verifica si la escena existe
				CoinManager.level_completed()  # Marca el nivel como completado
				get_tree().change_scene(siguiente_nivel_escena)  # Cambia a la escena del siguiente nivel
			else:
				print("No se encontró el siguiente nivel. Volviendo al menú principal.") # Debug
				AudioManager.play_menu_music()  # Reproduce la música del menú
				get_tree().change_scene(ruta_menu_principal)  # Cambia a la escena del menú principal
