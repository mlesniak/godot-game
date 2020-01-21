extends Node2D


func _process(delta):
	if Input.is_action_just_released("exit"):
		get_tree().quit()