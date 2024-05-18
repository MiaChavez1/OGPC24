extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()
	


func _on_start_pressed():
	DayTimer.music = "intro"
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
	

func _on_instuctions_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
