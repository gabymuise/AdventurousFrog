extends Node2D

export (int) var nextLevel

func get_next_level():
	return "res://Worlds/World" + str(nextLevel + 1) + ".tscn"
