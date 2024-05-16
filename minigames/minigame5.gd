extends Node2D

var code=false
var code2= false
var code3=false
var code4=false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func _on_key_1_pressed():
	code=true
	code2=false
	code3=false
	code4=false
	
func _on_key_2_pressed():
	if code:
		code2 = true
	code=false
	code3=false
	code4=false

func _on_key_3_pressed():
	if code2:
		code3 = true
	code2=false
	code=false
	code4=false


func _on_key_4_pressed():
	if code3:
		get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")
	code2=false
	code3=false
	code=false
