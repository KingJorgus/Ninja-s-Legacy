extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	#only trigger from above
	if(body.name == "Player"):
		body.velocity.y = -500
		animated_sprite_2d.play("jump")
