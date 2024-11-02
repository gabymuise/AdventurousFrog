extends KinematicBody2D

# Variables para mecánicas del juego
var ppm: int = 24  # Pixeles por metro para cálculos físicos
var direction_horizontal: float
var velocity: Vector2 = Vector2()
export var knockback_force: float = 200.0
export var distance_jump: float = 5 * ppm  # La altura del salto
export var time_jump: float = 0.5  # Duración del salto

var life = 3  # Vidas totales
var current_health: int = life  # Salud actual del jugador
var has_lost: bool = false  # Bandera para rastrear si el jugador ha perdido

# Vector de movimiento para efectos de retroceso
var motion = Vector2()

# Fuerza de salto y gravedad calculadas basadas en parámetros de salto
onready var strength_jump = (-2 * distance_jump) / time_jump
onready var gravity = (2 * distance_jump) / (time_jump * time_jump)
onready var speed: float = 8 * ppm  # Velocidad de movimiento del jugador

func _ready():
	if not is_in_group("Players"):
		add_to_group("Players")  # Agregar al grupo de jugadores para identificación

func _input(event):
	handle_input(event)  # Manejar eventos de entrada del jugador

func _physics_process(delta):
	update_physics(delta)  # Actualizar cálculos físicos
	update_animation()  # Actualizar animaciones del personaje según el estado

func handle_input(event):
	calculate_jump(event)  # Manejar entrada de salto
	calculate_direction()  # Manejar entrada de movimiento horizontal

func update_physics(delta):
	apply_gravity(delta)  # Aplicar gravedad al jugador
	move_character()  # Mover el personaje basado en la velocidad

func update_animation():
	if is_on_floor():  # Comprobar si el jugador está en el suelo
		if velocity.x == 0:
			play_animation("idle")  # Animación de inactividad
		else:
			play_animation("run")  # Animación de correr
	elif velocity.y < 0:
		play_animation("jump")  # Animación de salto
	elif velocity.y > 0:
		play_animation("fall")  # Animación de caída

func calculate_direction():
	direction_horizontal = Input.get_axis("ui_left", "ui_right")  # Obtener entrada horizontal
	velocity.x = direction_horizontal * speed  # Establecer velocidad horizontal
	flip_h()  # Voltear sprite según la dirección

func calculate_jump(event):
	if event.is_action_pressed("jump") and is_on_floor():  # Comprobar entrada de salto
		velocity.y = strength_jump  # Establecer velocidad vertical para saltar
		play_animation("jump")  # Reproducir animación de salto

func apply_gravity(delta):
	velocity.y += gravity * delta  # Aplicar gravedad a la velocidad vertical

func move_character():
	velocity = move_and_slide(velocity, Vector2.UP)  # Mover el personaje y manejar colisiones

# Agregar monedas al jugador
func add_Coin():
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer", true, false)  # Encontrar la capa HUD
	if canvasLayer:
		canvasLayer.update_coins()  # Actualizar el conteo de monedas en el HUD

func play_animation(animation_name: String):
	if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != animation_name:
		$AnimationPlayer.play(animation_name)  # Reproducir la animación especificada

func flip_h():
	if direction_horizontal != 0:  # Voltear sprite según la dirección
		$Sprite.flip_h = direction_horizontal > 0

# Función para manejar reinicio del nivel.
func _loseLife():
	print("Reinicia nivel")  # Debug
	CoinManager.on_player_death()  # Reiniciar las monedas del nivel
	get_tree().reload_current_scene()  # Recargar la escena actual

# Función para reducir la salud por una cantidad especificada
func lose_health(damage_amount: int = 1):
	current_health = clamp(current_health - damage_amount, 0, life)  # Actualizar salud
	var hud = get_tree().get_root().find_node("CanvasLayer", true, false)  # Encontrar el HUD
	if hud:
		hud.lose_health(damage_amount)  # Actualizar la visualización de salud en el HUD

	if current_health <= 0 and not has_lost:
		has_lost = true  # Death
		CoinManager.on_player_death()  # Reiniciar monedas al morir
		get_tree().reload_current_scene()  # Recargar la escena al morir

# Aplicar efecto de retroceso al jugador
func apply_knockback(player):
	var direction = (player.position - position).normalized()  # Calcular dirección
	player.velocity.x = direction.x * knockback_force  # Aplicar retroceso horizontal
	player.velocity.y = -100  # Aplicar retroceso vertical

	# Para un efecto de retroceso más suave:
	player.velocity += Vector2(direction.x * knockback_force, -100).normalized() * knockback_force * 0.5
