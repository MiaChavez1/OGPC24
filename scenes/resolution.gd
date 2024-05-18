extends Control

const resolutionDict : Dictionary = {
	"1200 x 648": Vector2i(1200, 648),
	"1280 x 720": Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080)
	}
	

func _ready():
	$HBoxContainer/OptionButton.item_selected.connect(on_resolution_selected)
	add_resolution_items()

func add_resolution_items()-> void:
	for resolutionSize in resolutionDict:
		$HBoxContainer/OptionButton.add_item(resolutionSize)

func on_resolution_selected(index: int)-> void:
	DisplayServer.window_set_size(resolutionDict.values()[index])
