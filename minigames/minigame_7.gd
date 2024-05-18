extends Node2D

@export var pipe_scene : PackedScene

var game_running : bool
var game_over : bool
var scroll

const SCROLL_SPEED : int = 4
var screen_size : Vector2i
var ground_height : int
var pipes : Array
const PIPE_DELAY : int = 100
const PIPE_RANGE : int = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	ground_height = 5
	new_game()

func new_game():
	#reset variables
	game_running = false
	game_over = false
	scroll = 0
	get_tree().call_group("pipes", "queue_free")
	pipes.clear()
	#generate starting pipes
	generate_pipes()
	$bedHead.reset()
	
func _input(event):
	if game_over == false:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
				if game_running == false:
					start_game()
				else:
					if $bedHead.flying:
						$bedHead.flap()
						check_top()

func start_game():
	game_running = true
	$bedHead.flying = true
	$bedHead.flap()
	#start pipe timer
	$Timer.start()
	$Timer2.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_running:
		scroll += SCROLL_SPEED
		#reset scroll
		if scroll >= screen_size.x:
			scroll = 0
		#move ground node
		$Ground.position.x = -scroll
		#move pipes
		for pipe in pipes:
			pipe.position.x -= SCROLL_SPEED
			
func _on_timer_timeout():
	generate_pipes()

func generate_pipes():
	var pipe = pipe_scene.instantiate()
	pipe.position.x = screen_size.x + PIPE_DELAY
	pipe.position.y = (screen_size.y - ground_height) / 2  + randi_range(-PIPE_RANGE, PIPE_RANGE)
	pipe.hit.connect(bird_hit)
	add_child(pipe)
	pipes.append(pipe)
	
	

func check_top():
	if $bedHead.position.y < 0:
		$bedHead.falling = true
		get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")


func stop_game():
	$Timer.stop()
	$bedHead.flying = false
	game_running = false
	game_over = true
	
func bird_hit():
	$bedHead.falling = true
	get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")


func _on_ground_hit():
	$bedHead.falling = false
	get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")



func _on_timer_2_timeout():
	DayTimer.progress +=25
	DayTimer.complete += 1
	get_tree().change_scene_to_file("res://scenes/crystal_room.tscn")
