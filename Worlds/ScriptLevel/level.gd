extends Node2D

export (int) var nextLevel  # Exporta la variable nextLevel para configurarla desde el editor

# Retorna la ruta al siguiente nivel
func get_next_level() -> String:
	return "res://Worlds/Easy/World" + str(nextLevel + 1) + ".tscn"  # Construye y devuelve la ruta del siguiente nivel
