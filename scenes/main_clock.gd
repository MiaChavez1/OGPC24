extends Node2D
var paused = false
var open = false

@onready var pauseMenu = $pauseMenu
@onready var inventory = $inventory

func _ready():
	$tasks.text = str(DayTimer.complete)+"/2 Tasks Complete
Curent Task: " + DayTimer.task
	if DayTimer.hat:
		$hat.hide()


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


func _on_hat_body_entered(body):
	DayTimer.hat = true
	$hat.hide()
	$inventory/item1.show()


func _on_area_2d_body_entered(body):
	if DayTimer.task == "tumbleweed":
		get_tree().change_scene_to_file("res://minigames/tumbleweed_run.tscn")


func _on_target_body_entered(body):
	if DayTimer.task == "shooting range":
		get_tree().change_scene_to_file("res://minigames/minigame6.tscn")


func _on_door_body_entered(body):
	if DayTimer.task == "Fix Elevator":
		DayTimer.complete = 0
		var crystalTasks =["Tune piano", "Dodge Crystals"]
		var taskCrystal = randi_range(0, 0)
		DayTimer.task =crystalTasks[taskCrystal]
		DayTimer.music = "crystal"
		get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")
