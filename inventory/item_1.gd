extends RigidBody2D



func _on_button_mouse_entered():
	modulate.a = 0.5


func _on_button_mouse_exited():
	modulate.a = 1
