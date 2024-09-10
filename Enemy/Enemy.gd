extends KinematicBody2D

var gravity = 0 
var speed = 25
var velocity = Vector2(0,0)
var moving_left = true

func _process(delta):
	apply_gravity()
	move_character()
	handle_turn()

func apply_gravity():
	velocity.y += gravity

func move_character():
	if moving_left:
		velocity.x = -speed
	else:
		velocity.x = speed
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife()

func handle_turn():
	if not is_colliding_with_wall():
		turn_character()

func is_colliding_with_wall() -> bool:
	return $RayCast2D.is_colliding()

func turn_character():
	moving_left = !moving_left
	scale.x = -scale.x
