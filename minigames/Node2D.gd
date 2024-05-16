extends Node2D

var increase = true
var speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if increase:
		$slider.value +=speed
	else:
		$slider.value -=speed
		

	if $slider.value == 100:
		increase = false
		if speed >= 2:
			speed -= .4
	elif $slider.value == 0:
		increase = true
		

	


func _on_button_pressed():
	if $slider.value >= 70 && $slider.value <= 80:
		print("yay")
	else:
		speed=10
