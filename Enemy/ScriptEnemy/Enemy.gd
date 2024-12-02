extends KinematicBody2D

var gravity = 0  # Gravedad aplicada al enemigo
var speed = 25  # Velocidad de movimiento del enemigo
var velocity = Vector2(0, 0)  # Vector de velocidad del enemigo
var moving_left = true  # Indica si el enemigo se mueve hacia la izquierda

func _ready():
	$RayCast2D.enabled = true

# Se ejecuta cada frame
func _process(delta):
	apply_gravity()  # Aplica gravedad al enemigo
	move_character()  # Mueve al enemigo en la dirección actual

# Aplica gravedad al enemigo
func apply_gravity():
	velocity.y += gravity  # Incrementa la componente vertical de la velocidad

# Mueve al enemigo en función de la dirección
func move_character():
	velocity.x = -speed if moving_left else speed  # Establece la velocidad horizontal
	velocity = move_and_slide(velocity, Vector2.UP)  # Mueve al enemigo y aplica la gravedad

	# Verifica si el RayCast2D ya no está colisionando con el suelo.
	if not $RayCast2D.is_colliding():
		handle_turn()  

# Detecta colisiones y gestiona el cambio de dirección
func handle_turn():
	if not is_colliding_with_wall():  # Si no está colisionando con el piso, gira
		turn_character()

# Verifica si el enemigo ha colisionado con el piso
func is_colliding_with_wall() -> bool:
	return $RayCast2D.is_colliding()  # Retorna verdadero si el RayCast colisiona con algo

# Invierte la dirección del enemigo cuando gira
func turn_character():
	moving_left = !moving_left  # Cambia la dirección del movimiento
	scale.x = -scale.x  # Invierte la escala horizontal para cambiar la dirección visual

# Si el jugador colisiona con el enemigo, pierde una vida y se aplica knockback
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):  # Verifica si el cuerpo es el jugador
		print("Jugador ha colisionado con el enemigo")  # Debug
		body.lose_health(1)  # Llama al método para que el jugador pierda vida
		apply_knockback(body)  # Aplica knockback al jugador

# Aplica el knockback al jugador
func apply_knockback(player):
	var direction = (player.position - position).normalized()  # Calcula la dirección hacia el jugador
	player.velocity.x = direction.x * player.knockback_force  # Establece la velocidad de knockback
