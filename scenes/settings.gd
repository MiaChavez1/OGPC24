extends Control


signal exit_options_menu

func _ready():
	$MarginContainer/VBoxContainer/Exit.button_down.connect(on_Exit_pressed)
	set_process(false)
		
func on_Exit_pressed()-> void:
	exit_options_menu.emit()
	set_process(false)
	
#Button to go back to menu
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
