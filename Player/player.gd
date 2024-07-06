extends KinematicBody2D

var ppm : int = 24
var direction_horizontal : float

var velocity : Vector2 = Vector2()

export var distance_jump : float = 5 * ppm
export var time_jump : float = 0.5

onready var strength_jump = (-2 * distance_jump) / time_jump
onready var gravity = (2 * distance_jump) / (time_jump * time_jump)
onready var speed : float = 8 * ppm

func _ready():
	pass

func _input(event):
	handle_input(event)

func _physics_process(delta):
	update_physics(delta)
	update_animation()

func handle_input(event : InputEvent):
	calculate_jump(event)
	calculate_direction()

func update_physics(delta):
	apply_gravity(delta)
	move_character()

func update_animation():
	if is_on_floor():
		if velocity.x == 0:
			play_animation("idle")
		else:
			play_animation("run")
	elif velocity.y < 0:
		play_animation("jump")
	elif velocity.y > 0:
		play_animation("fall")

func calculate_direction():
	direction_horizontal = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction_horizontal * speed
	flip_h()

func calculate_jump(event : InputEvent):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = strength_jump
		play_animation("jump")

func apply_gravity(delta):
	velocity.y += gravity * delta

func move_character():
	velocity = move_and_slide(velocity, Vector2.UP)

func play_animation(animation_name: String):
	if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != animation_name:
		$AnimationPlayer.play(animation_name)

func flip_h():
	if direction_horizontal != 0:
		$Sprite.flip_h = direction_horizontal > 0

func add_Coin():
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer", true, false)
	if canvasLayer:
		canvasLayer.handleCoinCollected()

func _loseLife():
	print("reinicia nivel")
	get_tree().reload_current_scene()
