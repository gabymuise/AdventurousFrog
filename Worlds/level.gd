extends Node2D

export (int) var nextLevel

func get_next_level():
	return "res://Worlds/Easy/World" + str(nextLevel + 1) + ".tscn"
