extends KinematicBody2D

var gravity = 0  # Fuerza gravitacional aplicada al enemigo.
var speed = 25  # Velocidad horizontal del enemigo.
var velocity = Vector2(0, 0)  # Vector que representa la velocidad actual del enemigo.
var moving_left = true  # Indica si el enemigo se mueve hacia la izquierda.
var health = 1  # Cantidad de vida del enemigo.

# Configura el enemigo al inicio.
func _ready():
	$RayCast2D.enabled = true  # Habilita el RayCast2D para detectar el suelo.

# Se ejecuta cada frame.
func _process(_delta):
	apply_gravity()  # Aplica la fuerza de gravedad.
	move_character()  # Mueve al enemigo basado en su dirección actual.

# Aplica gravedad al enemigo aumentando la velocidad vertical.
func apply_gravity():
	velocity.y += gravity

# Controla el movimiento horizontal del enemigo.
func move_character():
	velocity.x = -speed if moving_left else speed  # Determina la dirección del movimiento.
	velocity = move_and_slide(velocity, Vector2.UP)  # Aplica movimiento con deslizamiento y gravedad.

	# Si el RayCast2D ya no detecta colisión, cambia la dirección.
	if not $RayCast2D.is_colliding():
		handle_turn()

# Gestiona el cambio de dirección cuando el enemigo deja de colisionar con el suelo.
func handle_turn():
	if not is_colliding_with_wall():
		turn_character()

# Verifica si el enemigo está colisionando con un objeto.
func is_colliding_with_wall() -> bool:
	return $RayCast2D.is_colliding()

# Cambia la dirección visual y lógica del enemigo.
func turn_character():
	moving_left = !moving_left  # Cambia la dirección del movimiento.
	scale.x = -scale.x  # Invierte la escala horizontal.

# Llama cuando el jugador colisiona con el enemigo.
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		print("Jugador ha colisionado con el enemigo")  # Mensaje de depuración.
		body.lose_health(1)  # Reduce la vida del jugador.
		apply_knockback(body)  # Aplica un retroceso al jugador.

# Reduce la salud del enemigo y lo elimina si es necesario.
func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()

# Aplica un efecto de retroceso al jugador.
func apply_knockback(player):
	var direction = (player.position - position).normalized()  # Calcula la dirección del impacto.
	player.velocity.x = direction.x * player.knockback_force  # Ajusta la velocidad del jugador.
