extends Node2D

export var speed = 400  # Velocidad de la bala.
var direction = Vector2.RIGHT  # Dirección de la bala.

# Este método se ejecuta en cada frame y actualiza la posición de la bala.
func _process(delta):
	# Mueve la bala en la dirección especificada.
	position += direction * speed * delta

# Maneja la colisión con otros cuerpos.
func _on_Area2D_body_entered(body):
	if body.is_in_group("Players"):  # Verifica si el cuerpo pertenece al grupo "Players".
		body.call_deferred("lose_health")  # Llama al método para reducir la salud del jugador de manera segura.
		queue_free()  # Destruye la bala después de impactar.

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
