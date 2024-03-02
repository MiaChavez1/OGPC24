extends Node2D


# Called when the node enters the scene tree for the first time.
var dragged_item : item_1 = null

func _process(delta):
	if Input.is_action_pressed("ui_click"):
		if dragged_item == null:
			# Check for item under the mouse pointer
			var item_under_mouse = get_item_under_mouse()
			
			if item_under_mouse:
				dragged_item = item_under_mouse
				dragged_item.start_drag()
		elif dragged_item != null:
			# Release the item when the mouse button is released
			dragged_item.stop_drag()
			dragged_item = null

	# Apply gravity to dragged item
	if dragged_item != null:
		dragged_item.apply_gravity(delta)

# Function to check for an item under the mouse pointer
func get_item_under_mouse() -> Item:
	var item = null
	var mouse_position = get_global_mouse_position()
	var items = get_tree().get_nodes_in_group("items")  # Assuming items are in a group called "items"

	for i in items:
		if i.get_rect().has_point(mouse_position):
			item = i
			break

	return item
