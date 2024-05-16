extends Node2D

@export var tumble_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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


func _on_time_timeout():
	get_tree().change_scene_to_file("res://scenes/main_clock.tscn")


