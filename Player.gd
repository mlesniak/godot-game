extends KinematicBody2D

# Emitted, if other player is hit.
signal hit(source, target)
signal score_updated(score)

export var texture: Texture
export var gamepad: int = 0
export var speed: int = 2000

export var catchable: bool = false
export var score: int = 0

func _ready():
	$Sprite.texture = texture

func get_force(direction):
	var name = str(gamepad) + "_move_" + direction
	return Input.get_action_strength(name)

func compute_velocity(delta):
	var dx =  get_force("right") - get_force("left")
	var dy =  get_force("down") - get_force("up")
	var velocity = Vector2(dx, dy)
	velocity = velocity.normalized()  * speed
	return velocity

func _process(delta):
	var velocity = compute_velocity(delta)
	move_and_slide(velocity)
	
	# Check for collision.
	for i in range(0, get_slide_count()):
		var collider = get_slide_collision(i).collider
		if collider.is_in_group("player") && collider.catchable:
			emit_signal("hit", self, collider)
	
	