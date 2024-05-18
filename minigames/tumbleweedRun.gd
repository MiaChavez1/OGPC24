extends Node2D

@export var tumble_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#keeps bend in bound
	if $Ben.position.x <=50:
		$Ben.position.x +=10
	elif $Ben.position.x >=1125:
		$Ben.position.x -=10
	if $Ben.position.y >=515:
		$Ben.position.y -=10
	elif $Ben.position.y <= 75:
		$Ben.position.y +=10


func _on_tumbleweeds_timeout():
	var tumbleweed = tumble_scene.instantiate()
	
	var tumble_spawn_location = $Path2D/PathFollow2D
	tumble_spawn_location.progress_ratio = randf()

	var direction = tumble_spawn_location.rotation + PI / 2
	tumbleweed.position = tumble_spawn_location.position

	
	direction += randf_range(-PI / 4, PI / 4)
	

	
	var velocity = Vector2(randf_range(500.0, 750.0), 0.0)
	tumbleweed.linear_velocity = velocity.rotated(direction)
	
	
	add_child(tumbleweed)

## when time runs out 
func _on_time_timeout():
	DayTimer.progress +=25
	DayTimer.task = "Fix Elevator"
	DayTimer.complete += 1
	get_tree().change_scene_to_file("res://scenes/main_clock.tscn")


