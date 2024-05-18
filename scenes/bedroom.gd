extends Node2D
var paused = false
var open = false

@onready var pauseMenu = $pauseMenu
@onready var inventory = $inventory


# Called when the node enters the scene tree for the first time.
func _ready():
	if DayTimer.bedroomID ==12:
		$DialoguePlayer.show()
	$tasks.text = str(DayTimer.complete)+"/2 Tasks Complete
Curent Task: " + DayTimer.task


# gets inputs for menu screens
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("inventory"):
		inventoryOpen()
		
	if DayTimer.dustin:
		$dustin.show()
	if !DayTimer.dustin:
		$dustin.hide()
	
		
# paueses and unpauses the game
func pause():
	if paused:
		pauseMenu.hide()
		Engine.time_scale =1
	else:
		pauseMenu.show()
		Engine.time_scale =0
		
	paused = !paused
	
# opens and closes the inventory
func inventoryOpen():
	if open:
		inventory.hide()
	else:
		inventory.show()
	open = !open


# gives a random task when they enter the room
func _on_door_body_entered(body):
	if DayTimer.task == "Fix Elevator":
		DayTimer.complete = 0
		var cowboyTasks =["tumbleweed", "shooting range"]
		var taskCowboy = randi_range(0, 1)
		DayTimer.task =cowboyTasks[taskCowboy]
		DayTimer.music = "cowboy"
		get_tree().change_scene_to_file("res://scenes/main_clock.tscn")


# called when ben collides with the broom and starts the sweep minigame
func _on_broom_body_entered(body):
	if DayTimer.task == "Sweep":
		get_tree().change_scene_to_file("res://minigames/sweeping.tscn")
	
	


# called when ben collides with the clocl and starts the clock minigame
func _on_clock_body_entered(body):
	if DayTimer.task == "set clock":
		get_tree().change_scene_to_file("res://minigames/minigame_4.tscn")


func _on_note_body_entered(body):

	DayTimer.dustin = true
	$DialoguePlayer.show()
