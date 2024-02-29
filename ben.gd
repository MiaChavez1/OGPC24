extends CharacterBody2D

@export var speed = 400
var input = Vector2.ZERO

func get_input():
	
	input.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	input.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	
	return input.normalized()
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	movement(delta)

func movement(delta):
	input= get_input()
	
	if input == Vector2.ZERO:
		if velocity.length()> (700 *delta):
			velocity -= velocity.normalized() *(700*delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input *1000*delta)
		velocity = velocity.limit_length(300)
		
	move_and_slide()
