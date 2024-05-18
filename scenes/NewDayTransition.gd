extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if DayTimer.time == 0:
		var bedroomTasks = ["Sweep", "set clock"]
		
		
		var taskBedroom = randi_range(0, 1)
		if DayTimer.day != 1:
			DayTimer.task =bedroomTasks[taskBedroom]
		else:
			DayTimer.task = "Sweep"
		transition()
	else:
		$ColorRect.hide()
		$HBoxContainer.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if DayTimer.time == 0:
		if DayTimer.progress == 0:
			get_tree().change_scene_to_file("res://scenes/end.tscn")
		DayTimer.progress = 0
		$AnimationPlayer.play("fadeOut")
	
	$HBoxContainer/Label2.text = str(DayTimer.day)

func transition():
	$AnimationPlayer.play("fadeIn")
	
	

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeOut":
		DayTimer.music = "bedroom"
		get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
	
