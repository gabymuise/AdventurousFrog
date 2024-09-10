extends Node2D

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		var current_level = get_parent()  # Obtener el nodo que representa el nivel actual
		if current_level.has_method("get_next_level"):
			var next_level_scene = current_level.get_next_level()
			get_tree().change_scene(next_level_scene)  # Cambiar al siguiente nivel
