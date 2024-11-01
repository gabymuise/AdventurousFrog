extends "res://Enemy/Enemy.gd"

var bullet_scene = preload("res://Enemy/Bullet.tscn")  # Pre-carga la escena de la bala

# Se ejecuta cuando el nodo está listo
func _ready():
	$VisionArea.connect("body_entered", self, "_on_vision_area_entered")

# Método que se activa cuando un cuerpo entra en el área de visión
func _on_vision_area_entered(body):
	if body.is_in_group("Players"):  # Verifica si el cuerpo es un jugador
		print("Jugador detectado, disparando...")  # Debug
		shoot_bullet()  # Llama al método para disparar una bala

# Método para disparar una bala
func shoot_bullet():
	var bullet_instance = bullet_scene.instance()  # Instancia una nueva bala de la escena
	get_parent().add_child(bullet_instance)  # Añade la bala a la escena
	bullet_instance.position = position  # Establece la posición de la bala en la posición actual del enemigo
	var player = get_tree().get_root().find_node("Player", true, false)  # Encuentra el nodo del jugador en la escena
	bullet_instance.direction = (player.position - position).normalized()  # Calcula la dirección hacia el jugador y la normaliza
