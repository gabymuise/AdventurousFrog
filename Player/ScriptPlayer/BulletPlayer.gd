extends Node2D

export var speed = 400
var direction = Vector2.RIGHT

func _process(delta):
	position -= direction * speed * delta

func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemies"):
		if body.has_method("take_damage"):
			body.take_damage(1)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
