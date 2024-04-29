extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	
	if DayTimer.time == 0:
		transition()
	else:
		$ColorRect.hide()
		$HBoxContainer.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if DayTimer.time == 0:
		$AnimationPlayer.play("fadeOut")
	
	$HBoxContainer/Label2.text = str(DayTimer.day)

func transition():
	$AnimationPlayer.play("fadeIn")
	
	

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeOut":
		get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
	
