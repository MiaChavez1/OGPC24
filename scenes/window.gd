extends Control

const windowOptions: Array[String] = ["Full Screen", "Window ", "Borderless Full", "Borderless Window"]
# Called when the node enters the scene tree for the first time.
func _ready():
	add_window_mode_items()
	$HBoxContainer/OptionButton.item_selected.connect(on_window_mode_selected)
	
func add_window_mode_items()-> void:
	for windowMode in windowOptions:
		$HBoxContainer/OptionButton.add_item(windowMode)
		
func on_window_mode_selected(index:int)-> void:
	match index:
		0:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_get_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

