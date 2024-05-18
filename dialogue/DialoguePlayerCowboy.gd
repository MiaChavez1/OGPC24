extends CanvasLayer

@export_global_file("*.json") var dialogue_file

var dialogues = []
var current_dialogue_id = DayTimer.cowboyID

# Called when the node enters the scene tree for the first time.
func _ready():
	play()
	

func play():
	dialogues = load_dialogues()
	
	
	DayTimer.bedroomID = current_dialogue_id
	next_line()
	
func _input(event):
	if event.is_action_pressed("next"):
		next_line()
	
func next_line():
	current_dialogue_id +=1
	DayTimer.bedroomID = current_dialogue_id
	
	if current_dialogue_id >= len(dialogues):
		hide()
		return
	$NinePatchRect/name.text = dialogues[current_dialogue_id]['name']
	$NinePatchRect/message.text = dialogues[current_dialogue_id]['text']
	
		
func load_dialogues():
	var file= FileAccess.open(dialogue_file, FileAccess.READ)
	if file.file_exists(dialogue_file):
		file.open(dialogue_file, file.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	
