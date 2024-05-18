extends Node2D


var draggingSquare = false
var draggingTriangle = false

var mouseInSquare = false
var mouseInTriangle = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var boxRandom = RandomNumberGenerator.new().randi_range(0, 3) 
	
	if boxRandom == 0:
		$box.texture = load("res://sprites/IMG_2083.PNG")
		$square.position = Vector2(790,180)
		$triangle.position = Vector2(410,480)
	elif boxRandom == 1:
		$box.texture = load("res://sprites/IMG_2084.PNG")
		$square.position = Vector2(790,480)
		$triangle.position = Vector2(410,180)
	elif boxRandom == 2:
		$box.texture = load("res://sprites/IMG_2085.PNG")
		$square.position = Vector2(410,480)
		$triangle.position = Vector2(790,180)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if mouseInSquare:
		draggingSquare = true
	else:
		draggingSquare = false
	
	if mouseInTriangle:
		draggingTriangle = true
	else:
		draggingTriangle = false
		

func _physics_process(delta):
	
	if draggingSquare:
		$square2.position=get_global_mouse_position()
		$square2.move_and_slide()
	if draggingTriangle:
		$triangle2.position=get_global_mouse_position()
		$triangle2.move_and_slide()

func _on_button_button_down():
	mouseInSquare = true


func _on_button_button_up():
	mouseInSquare = false


func _on_area_2d_body_entered(body):
	$square2.position = $square.position
	print("yye")


func _on_button_tri_button_down():
	mouseInTriangle = true


func _on_button_tri_button_up():
	mouseInTriangle = false


func _on_triangle_body_entered(body):
	$triangle.position = $triangle.position
	print("ejhrf")
