extends RigidBody2D


#greys out hat with mouse hovers
func _on_button_mouse_entered():
	modulate.a = 0.5

func _on_button_mouse_exited():
	modulate.a = 1

func _ready():
	if !DayTimer.hat:
		hide()
	if DayTimer.hat:
		show()
#toggles hat on and off
func _on_button_pressed():
	if !DayTimer.hat:
		DayTimer.hat = true
	elif DayTimer.hat:
		DayTimer.hat = false
