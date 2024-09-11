extends KinematicBody2D

var gravity = 0
var speed = 25
var velocity = Vector2(0, 0)
var moving_left = true

func _process(delta):
	apply_gravity()
	move_character()
	handle_turn()

# Aplica gravedad al enemigo
func apply_gravity():
	velocity.y += gravity

# Mueve al enemigo en función de la dirección
func move_character():
	velocity.x = -speed if moving_left else speed
	velocity = move_and_slide(velocity, Vector2.UP)

# Detecta colisiones y gestiona el cambio de dirección
func handle_turn():
	if not is_colliding_with_wall():
		turn_character()

# Verifica si el enemigo ha colisionado con una pared
func is_colliding_with_wall() -> bool:
	return $RayCast2D.is_colliding()

# Invierte la dirección del enemigo cuando gira
func turn_character():
	moving_left = !moving_left
	scale.x = -scale.x

# Si el jugador colisiona con el enemigo, pierde una vida
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):
		body._loseLife()
