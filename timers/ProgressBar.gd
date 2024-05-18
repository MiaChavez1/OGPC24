extends Control

# updates progress bar based on tasks completed
func _process(delta):
	$AspectRatioContainer/TextureProgressBar.value=DayTimer.progress
