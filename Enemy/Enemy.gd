extends KinematicBody2D

var gravity = 0 
var speed = 25
var velocity = Vector2(0,0)
var moving_left = true

func _process(delta):
	move_character()
	turn()

func move_character():
	
	velocity.y +=gravity
	
	if(moving_left):
		velocity.x = -speed
		velocity = move_and_slide(velocity,Vector2.UP)
	else:
		velocity.x = speed
		velocity = move_and_slide(velocity,Vector2.UP)

func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		body._loseLife()

func turn():
	if not $RayCast2D.is_colliding():
		moving_left = !moving_left
		scale.x = -scale.x
