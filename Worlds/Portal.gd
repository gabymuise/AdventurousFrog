extends Node2D

func _ready():
	pass 




func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().change_scene("res://Worlds/World2.tscn"	)
