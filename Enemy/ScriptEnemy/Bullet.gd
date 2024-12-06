extends Node2D

export var speed = 400  # Velocidad de movimiento de la bala.
var direction = Vector2.RIGHT  # Dirección inicial de la bala.

# Este método se ejecuta en cada frame y actualiza la posición de la bala.
func _process(delta):
	# Mueve la bala en la dirección especificada según su velocidad y el tiempo delta.
	position += direction * speed * delta

# Maneja la colisión de la bala con otros cuerpos.
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):  # Comprueba si el cuerpo pertenece al grupo "Players".
		body.call_deferred("lose_health")  # Reduce la salud del jugador de manera segura.
		queue_free()  # Destruye la bala tras colisionar.

# Detecta cuando la bala sale de la pantalla y la destruye.
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
