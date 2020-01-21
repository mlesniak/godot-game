extends KinematicBody2D

export var texture: Texture
export var gamepad: int = 0
export var speed: int = 3000

export var catchable: bool = false
export var score: int = 0

func _ready():
	$Sprite.texture = texture

func get_force(direction):
	var name = str(gamepad) + "_move_" + direction
	return Input.get_action_strength(name)

func compute_velocity():
	var dx =  get_force("right") - get_force("left")
	var dy =  get_force("down") - get_force("up")
	var velocity = Vector2(dx, dy)
	velocity = velocity.normalized() * speed
	return velocity

func _process(delta):
	var velocity = compute_velocity()
	move_and_slide(velocity)
	
	