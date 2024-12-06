extends "res://Enemy/ScriptEnemy/Enemy.gd"

var bullet_scene = preload("res://Enemy/SceneEnemy/Bullet.tscn")  # Pre-carga la escena de la bala.

# Configuración inicial del enemigo.
func _ready():
	health = 2  # Inicializa la vida del enemigo.
	var _connect_result = $VisionArea.connect("body_entered", self, "_on_vision_area_entered")  # Conecta la señal del área de visión.

# Detecta cuando un jugador entra en el área de visión.
func _on_vision_area_entered(body):
	if body.is_in_group("Players"):
		print("Jugador detectado, disparando...")  # Mensaje de depuración.
		call_deferred("shoot_bullet")  # Dispara una bala de manera segura.

# Dispara una bala hacia la posición del jugador.
func shoot_bullet():
	var bullet_instance = bullet_scene.instance()  # Crea una instancia de la bala.
	get_tree().get_current_scene().add_child(bullet_instance)  # Añade la bala a la escena actual.
	bullet_instance.position = position  # Posiciona la bala en el enemigo.
	
	# Encuentra al jugador y calcula la dirección del disparo.
	var player = get_tree().get_root().find_node("Player", true, false)
	bullet_instance.direction = (player.position - position).normalized()

# Reduce la salud del enemigo y lo elimina si es necesario.
func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()  # Elimina al enemigo si su salud llega a cero.
	else:
		modulate = Color(1, 0.5, 0.5)  # Cambia el color para indicar daño.
		yield(get_tree().create_timer(0.1), "timeout")  # Espera un tiempo.
		modulate = Color(1, 1, 1)  # Restaura el color original.
