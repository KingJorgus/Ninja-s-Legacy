extends Node

var score = 0

@onready var score_label: Label = $UI/ScoreLabel

func _ready():
	# Set the initial text when the game launches
	score_label.text = "Score: " + str(score)

func add_points():
	score += 1
	score_label.text = "Score: " + str(score)


func _on_finish_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
