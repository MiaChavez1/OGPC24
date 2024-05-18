extends Node2D

func _process(delta):
	if DayTimer.music == "default":
		$default.play()
		$crystal.stop()
	elif DayTimer.music == "intro":
		$intro.play()
		$default.stop()
	elif DayTimer.music == "bedroom":
		$bedroom.play()
		$intro.stop()
		$crystal.stop()
	elif DayTimer.music == "cowboy":
		$cowboy.play()
		$bedroom.stop()
	elif DayTimer.music == "crystal":
		$crystal.play()
		$cowboy.stop()
	DayTimer.music = ""
