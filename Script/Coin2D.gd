extends Area2D

signal coinCollected

func _ready():
	print("Coin2D ready")
	connect("body_entered", self, "_on_Coin2D_body_entered")

func _on_Coin2D_body_entered(body):
	if body.name == "Player":
		print("Player entered Coin2D")
		body.add_Coin()
		emit_signal("coinCollected")
		queue_free()
