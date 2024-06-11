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
	calculate_jump(event)

func _physics_process(delta):
	calculate_direction()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor():
		if velocity.x == 0:
			if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "idle":
				$AnimationPlayer.play("idle")
		else:
			if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "run":
				$AnimationPlayer.play("run")
	elif velocity.y < 0:
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "jump":
			$AnimationPlayer.play("jump")
	elif velocity.y > 0:
		if not $AnimationPlayer.is_playing() or $AnimationPlayer.current_animation != "fall":
			$AnimationPlayer.play("fall")

func calculate_direction():
	direction_horizontal = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction_horizontal * speed
	if direction_horizontal != 0:
		$Sprite.flip_h = direction_horizontal > 0

func calculate_jump(event : InputEvent):
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = strength_jump
		$AnimationPlayer.play("jump")

func add_Coin():
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer", true, false)
	if canvasLayer:
		canvasLayer.handleCoinCollected()
