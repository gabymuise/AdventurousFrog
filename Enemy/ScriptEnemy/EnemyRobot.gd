extends "res://Enemy/ScriptEnemy/Enemy.gd"

var bullet_scene = preload("res://Enemy/SceneEnemy/Bullet.tscn")  # Pre-carga la escena de la bala

# Se ejecuta cuando el nodo está listo
func _ready():
	health = 2  
	var _connect_result = $VisionArea.connect("body_entered", self, "_on_vision_area_entered")


# Método que se activa cuando un cuerpo entra en el área de visión
func _on_vision_area_entered(body):
	if body.is_in_group("Players"):  # Verifica si el cuerpo es un jugador
		print("Jugador detectado, disparando...")  # Debug
		call_deferred("shoot_bullet")  # Llama al método para disparar una bala de manera segura

# Método para disparar una bala
func shoot_bullet():
	var bullet_instance = bullet_scene.instance()  # Instancia una nueva bala de la escena
	get_tree().get_current_scene().add_child(bullet_instance) # Añade la bala a la escena
	bullet_instance.position = position  # Establece la posición de la bala en la posición actual del enemigo
	var player = get_tree().get_root().find_node("Player", true, false)  # Encuentra el nodo del jugador en la escena
	bullet_instance.direction = (player.position - position).normalized()  # Calcula la dirección hacia el jugador y la normaliza

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
	else:
		modulate = Color(1, 0.5, 0.5)  
		yield(get_tree().create_timer(0.1), "timeout")
		modulate = Color(1, 1, 1)  
