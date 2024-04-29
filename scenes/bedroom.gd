extends Node2D
var paused = false
var open = false
@onready var pauseMenu = $pauseMenu
@onready var inventory = $inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



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



func _on_door_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/main_clock.tscn")



func _on_broom_body_entered(body):
	get_tree().change_scene_to_file("res://minigames/sweeping.tscn")
