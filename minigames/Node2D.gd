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
	if $slider.value >= 50 && $slider.value <= 60:
		DayTimer.progress +=25
		DayTimer.task = "Fix Elevator"
		DayTimer.complete += 1
		get_tree().change_scene_to_file("res://scenes/main_clock.tscn")
	else:
		speed=10
