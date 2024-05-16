extends Node2D

var handHour = 0
var handMinute =0
var hour = randi_range(1, 12)
var minute=randi_range(00,59)
var hourTrue = false
var minuteTrue = true
# Called when the node enters the scene tree for the first time.
func _ready():

	if minute < 10:
		$Label.text= str(hour) + ":0" + str(minute)
	else:
		$Label.text= str(hour) + ":" + str(minute)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !hourTrue:
		$AspectRatioContainer/hourHand.rotate(.1)
		handHour+=5
	if handHour == 315:
		handHour =0
	if hourTrue && minuteTrue:
		$AspectRatioContainer/minuteHand.rotate(.15)
		handMinute+=5
	if handMinute == 210:
		handMinute =0
		
	if hourTrue && !minuteTrue:
		await get_tree().create_timer(2.0).timeout
		DayTimer.task = "Fix Elevator"
		DayTimer.progress +=20

		DayTimer.complete += 1
		get_tree().change_scene_to_file("res://scenes/bedroom.tscn")
		
	
func _on_button_pressed():
	if hour == 1:
		if handHour >= 15 && handHour <= 35 :
			hourTrue = true
	if hour == 2:
		if handHour >= 35 && handHour <= 65 :
			hourTrue = true
	if hour == 3:
		if handHour >= 65 && handHour <= 95 :
			hourTrue = true
	if hour == 4:
		if handHour >= 75 && handHour <= 115 :
			hourTrue = true
	if hour == 5:
		if handHour >= 115 && handHour <= 145 :
			hourTrue = true
	if hour == 6:
		if handHour >= 145 && handHour <= 170 :
			hourTrue = true
	if hour == 7:
		if handHour >= 170 && handHour <= 195 :
			hourTrue = true
	if hour == 8:
		if handHour >= 195 && handHour <= 220 :
			hourTrue = true
	if hour == 9:
		if handHour >= 220 && handHour <= 250 :
			hourTrue = true
	if hour == 10:
		if handHour >= 250 && handHour <= 275 :
			hourTrue = true
	if hour == 11:
		if handHour >= 275 && handHour <= 300 :
			hourTrue = true
	if hour == 12:
		if handHour >= 300 || handHour<=15 :
			hourTrue = true
	
	if hourTrue:
		if minute <=5:
			if handMinute >=10 && handMinute <= 35 :
				minuteTrue= false
		if minute >= 5 && minute <=10:
			if handMinute >=35 && handMinute <= 45 :
				minuteTrue= false
		if minute >= 10 && minute <=15:
			if handMinute >=45 && handMinute <= 60 :
				minuteTrue= false
		if minute >= 15 && minute <=20:
			if handMinute >=60 && handMinute <= 75 :
				minuteTrue= false
		if minute >= 20 && minute <=25:
			if handMinute >=75 && handMinute <= 95 :
				minuteTrue= false
		if minute >= 25 && minute <=30:
			if handMinute >=95 && handMinute <= 115 :
				minuteTrue= false
		if minute >= 30 && minute <=35:
			if handMinute >=115 && handMinute <= 130 :
				minuteTrue= false
		if minute >= 35 && minute <=40:
			if handMinute >=130 && handMinute <= 145 :
				minuteTrue= false
		if minute >= 40 && minute <=45:
			if handMinute >=145 && handMinute <= 165 :
				minuteTrue= false
		if minute >= 45 && minute <=50:
			if handMinute >=165 && handMinute <= 185 :
				minuteTrue= false
		if minute >= 50 && minute <=55:
			if handMinute >=185 && handMinute <= 200 :
				minuteTrue= false
		if minute >= 55 || minute <=5:
			if handMinute >=200 || handMinute <= 10 :
				minuteTrue= false
