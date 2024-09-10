extends Node2D

export (int) var nextLevel # Nivel actual (se exporta para poder cambiar desde el editor)

func get_next_level():
	# Retorna el siguiente nivel de acuerdo al actual
	return "res://Worlds/World" + str(nextLevel + 1) + ".tscn"
