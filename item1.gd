extends Node2D

var selected = false
var velocity = Vector2.ZERO
var gravity =400
var collided = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		
func _physics_process(delta):
	
	if selected:
		global_position= lerp(global_position, get_global_mouse_position(), 25* delta)
	elif !selected and !collided:
		velocity.y += gravity*delta
		position.y += velocity.y *delta
	else:
		velocity.y = 0
	
	

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("inventoryBag"):
		velocity= Vector2.ZERO
