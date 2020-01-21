extends Node2D


func _process(delta):
	if Input.is_action_just_released("exit"):
		get_tree().quit()
		
	if Input.is_action_just_released('fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen	