extends Node2D

var code=false
var code2= false
var code3=false
var code4=false

func _ready():
	DayTimer.music = ""

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
		DayTimer.progress +=25
		DayTimer.complete += 1
		DayTimer.music = "crystal"
		get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")
	code2=false
	code3=false
	code=false


func _on_key_6_button_down():
	$blank.texture = load("res://sprites/IMG_0618.PNG")
	$key.stream = load("res://music/Low E.mp3")
	$key.play()



func _on_key_6_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_1_button_down():
	$blank.texture = load("res://sprites/IMG_0620.PNG")
	$key.stream = load("res://music/G.mp3")
	$key.play()
	


func _on_key_1_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_4_button_down():
	$blank.texture = load("res://sprites/IMG_0622.PNG")
	$key.stream = load("res://music/B.mp3")
	$key.play()


func _on_key_4_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_5_button_down():
	$blank.texture = load("res://sprites/IMG_0619.PNG")
	$key.stream = load("res://music/F.mp3")
	$key.play()


func _on_key_5_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_8_button_down():
	$blank.texture = load("res://sprites/IMG_0623.PNG")
	$key.stream = load("res://music/C.mp3")
	$key.play()


func _on_key_8_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_2_button_down():
	$blank.texture = load("res://sprites/IMG_0621.PNG")
	$key.stream = load("res://music/A.mp3")
	$key.play()



func _on_key_2_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_7_button_down():
	$blank.texture = load("res://sprites/IMG_0625.PNG")
	$key.stream = load("res://music/High E.mp3")
	$key.play()


func _on_key_7_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_key_3_button_down():
	$blank.texture = load("res://sprites/IMG_0624.PNG")
	$key.stream = load("res://music/D.mp3")
	$key.play()


func _on_key_3_button_up():
	$blank.texture = load("res://sprites/1Plain piano.PNG")
	$key.stop()


func _on_timer_timeout():
	$tune.play()
