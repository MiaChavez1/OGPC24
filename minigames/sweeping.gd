extends Node2D

var press = 0
var press2 =0
var press3 = 0
var press4 =0
var press5 = 0
var press6 =0
var cleaning = false
var cleaning2 = false
var cleaning3 = false
var cleaning4 = false
var cleaning5 = false
var cleaning6 = false
var clean= 0


# Called when the node enters the scene tree for the first time.
func _ready():
	var screenSize = get_viewport().get_visible_rect().size
	var rng = RandomNumberGenerator.new()
	var rndX1 = rng.randi_range(0, screenSize.x)
	var rndY1 = rng.randi_range(0, screenSize.y)
	$dust1.set_position(Vector2(rndX1,rndY1))
	var rndX2 = rng.randi_range(0, screenSize.x)
	var rndY2 = rng.randi_range(0, screenSize.y)
	$dust2.set_position(Vector2(rndX2,rndY2))
	var rndX3 = rng.randi_range(0, screenSize.x)
	var rndY3 = rng.randi_range(0, screenSize.y)
	$dust3.set_position(Vector2(rndX3,rndY3))
	var rndX4 = rng.randi_range(0, screenSize.x)
	var rndY4 = rng.randi_range(0, screenSize.y)
	$dust4.set_position(Vector2(rndX4,rndY4))
	var rndX5 = rng.randi_range(0, screenSize.x)
	var rndY5 = rng.randi_range(0, screenSize.y)
	$dust5.set_position(Vector2(rndX5,rndY5))
	var rndX6 = rng.randi_range(0, screenSize.x)
	var rndY6 = rng.randi_range(0, screenSize.y)
	$dust6.set_position(Vector2(rndX6,rndY6))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cleaning == true:
		press += 1
	if cleaning2 == true:
		press2 += 1
	if cleaning3 == true:
		press3 += 1
	if cleaning4 == true:
		press4 += 1
	if cleaning5 == true:
		press5 += 1
	if cleaning6 == true:
		press6 += 1
	
	if press == 100:
		$dust1/dustParticles/AnimationPlayer.play("cleanDust")
		clean +=1
		
	if press2 == 100:
		$dust2/dustParticles/AnimationPlayer.play("cleanDust")
		clean +=1
		
	if press3 == 100:
		$dust3/dustParticles/AnimationPlayer.play("cleanDust")
		clean +=1
	
	if press4 == 100:
		$dust4/dustParticles/AnimationPlayer.play("cleanDust")
		clean +=1

	if press5 == 100:
		$dust5/dustParticles/AnimationPlayer.play("cleanDust")
		clean +=1
	
	if press6 == 100:
		$dust6/dustParticles/AnimationPlayer.play("cleanDust")
		clean +=1
	

	if clean == 6:
		await get_tree().create_timer(5.0).timeout
		DayTimer.progress= 100
		get_tree().change_scene_to_file("res://scenes/bedroom.tscn")

	



func _on_button_button_down():
	cleaning = true


func _on_button_2_button_down():
	cleaning2 = true


func _on_button_3_button_down():
	cleaning3 = true


func _on_button_4_button_down():
	cleaning4 = true


func _on_button_5_button_down():
	cleaning5 = true


func _on_button_6_button_down():
	cleaning6 = true
