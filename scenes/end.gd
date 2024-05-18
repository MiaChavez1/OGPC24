extends Control

func _ready():
	DayTimer.music = "default"
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
