extends Label

var score = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_Player_2_hit(source, target):
	score = score + 1
	text = str(score)
