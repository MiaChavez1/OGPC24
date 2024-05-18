extends Node2D

@onready var arrow = $AspectRatioContainer/arrow

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DayTimer.time = $Timer2.get_time_left()

#makes arrow move for each second passed
func _on_timer_timeout():
	DayTimer.arrowRotation += .05
	arrow.set_rotation(DayTimer.arrowRotation)

#increases the day when the timer is done
func _on_timer_2_timeout():
	DayTimer.day +=1
