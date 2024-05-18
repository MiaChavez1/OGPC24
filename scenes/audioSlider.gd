extends Control

@export_enum("Background Music") var bus_name : String

func _ready():
	$HBoxContainer/HSlider.value_changed.connect(on_value_changed)
	
	
func change_name() -> void:
	$HBoxContainer/music.text = "Background Music Volume"
	
func change_level() -> void:
	$HBoxContainer/level.text = str($HBoxContainer/HSlider.value *100)
	
func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	change_level()
