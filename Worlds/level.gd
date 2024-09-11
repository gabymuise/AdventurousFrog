extends Node2D

export (int) var nextLevel

# Retorna la ruta al siguiente nivel
func get_next_level() -> String:
	return "res://Worlds/Easy/World" + str(nextLevel + 1) + ".tscn"
