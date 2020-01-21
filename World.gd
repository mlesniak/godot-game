extends Node2D

func _ready():
	$music.play()
	$Score_1.text = "0"
	$Score_2.text = "0"
	
	$Player_1.catchable = true
	$Player_1.position.x = 0
	$Player_1.position.y = get_viewport().size.y / 2 
	
	$Player_2.catchable = false
	$Player_2.position.x = get_viewport().size.x
	$Player_2.position.y = get_viewport().size.y / 2 
	
	$Timer.start()

func _process(delta):
	if Input.is_action_just_released("exit"):
		get_tree().quit()
		
	if Input.is_action_just_released('fullscreen'):
		OS.window_fullscreen = !OS.window_fullscreen	

func _on_Player_hit(source, target):
	$Player_1.catchable = !$Player_1.catchable
	$Player_1.position.x = 0
	$Player_1.position.y = get_viewport().size.y / 2 

	$Player_2.catchable = !$Player_2.catchable
	$Player_2.position.x = get_viewport().size.x
	$Player_2.position.y = get_viewport().size.y / 2 