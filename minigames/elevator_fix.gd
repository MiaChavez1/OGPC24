extends Node2D

var draggingDistance
var dir
var dragging = false
var newPosition= Vector2()

var mouseIn = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if mouseIn:
		dragging = true
	else:
		dragging = false
	
	var distance = ($end.position.x- $PinJoint2D.position.x) **2 + ($end.position.y- $PinJoint2D.position.y) **2
	
	if sqrt(distance) >= 360:
		dragging =false
		$end.position.x-=30
		
		

func _physics_process(delta):
	if dragging:
		$end.position=get_global_mouse_position()
		$end.move_and_slide()


func _on_button_button_down():
	mouseIn = true


func _on_button_button_up():
	mouseIn = false


func _on_area_2d_body_entered(body):
	$end.position = $plug.position

