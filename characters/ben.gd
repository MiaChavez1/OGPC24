extends CharacterBody2D

var input = Vector2.ZERO
#Ben character movement
func get_input():
	#gets user input to move ben
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
		$footsteps.play()
		$AnimatedSprite2D.stop()
		if velocity.length()> (500 *delta):
			velocity -= velocity.normalized() *(500*delta)
		else:
			velocity = Vector2.ZERO
		
	else:
		
		$AnimatedSprite2D.play("default")
		velocity += (input *500*delta)
		velocity = velocity.limit_length(150)
	
		if input.x >=0:
			$AnimatedSprite2D.flip_h = true
			$Sprite2D.set_offset(Vector2(450, 0))
			$Sprite2D.flip_h = true

		elif input.x <=0:
			$AnimatedSprite2D.flip_h = false
			$Sprite2D.set_offset(Vector2(0, 0))
			$Sprite2D.flip_h = false
		
		
	move_and_slide()

#Toggles hat on and off
func _process(delta):
	if DayTimer.hat == true:
		$Sprite2D.show()
	else:
		$Sprite2D.hide()
	

