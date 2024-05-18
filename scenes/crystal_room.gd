extends Node2D
var paused = false
var open = false

@onready var pauseMenu = $pauseMenu
@onready var inventory = $inventory

func _ready():
	$tasks.text = str(DayTimer.complete)+"/2 Tasks Complete
Curent Task: " + DayTimer.task


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("inventory"):
		inventoryOpen()
		
func pause():
	if paused:
		pauseMenu.hide()
		Engine.time_scale =1
	else:
		pauseMenu.show()
		Engine.time_scale =0
		
	paused = !paused

func inventoryOpen():
	if open:
		inventory.hide()
	else:
		inventory.show()
	open = !open

func _on_area_2d_body_entered(body):
	if DayTimer.task == "Tune piano":
		DayTimer.music = ""
		get_tree().change_scene_to_file("res://minigames/minigame_5.tscn")


func _on_crystals_body_entered(body):
	if DayTimer.task == "Dodge Crystals":
		get_tree().change_scene_to_file("res://minigames/minigame_7.tscn")
