extends Node2D


func _on_Play_pressed():
	get_tree().change_scene("res://World1.tscn")


func _on_Exit_pressed():
	get_tree().quit()
