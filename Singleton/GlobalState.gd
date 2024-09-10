extends Node

# Variable para almacenar la escena anterior
var previous_scene : String = ""

# Diccionario para almacenar datos
var data : Dictionary = {}

func _ready():
	pass

func set_data(key: String, value: Object) -> void:
	data[key] = value

func get_data(key: String) -> Object:
	return data.get(key, null)
