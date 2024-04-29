extends Node2D

@onready var arrow = $AspectRatioContainer/arrow



# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	DayTimer.time = $Timer2.get_time_left()

func _on_timer_timeout():
	DayTimer.arrowRotation += .05
	arrow.set_rotation(DayTimer.arrowRotation)


func _on_timer_2_timeout():
	DayTimer.day +=1
