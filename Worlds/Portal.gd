extends Node2D

export (String) var main_menu_scene_path = "res://Main/Menu.tscn"

func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		var current_level = get_parent()
		if current_level.has_method("get_next_level"):
			var next_level_scene = current_level.get_next_level()
			if next_level_scene != "" and ResourceLoader.exists(next_level_scene):
				CoinManager.level_completed()  # Marcar el nivel como completado
				get_tree().change_scene(next_level_scene)
			else:
				print("No se encontró el siguiente nivel. Volviendo al menú principal.")
				get_tree().change_scene(main_menu_scene_path)
