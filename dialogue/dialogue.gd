extends Control

signal dialogue_finished

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id = 0
var d_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$NinePatchRect.visible = false

	
func start(dialogue_file):
	print("starting dialogue")
	print(dialogue_file)
	if d_active:
		return 
	d_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue(dialogue_file)
	current_dialogue_id = -1
	next_script()
	
func load_dialogue(dialogue_file):
	var file = FileAccess.open(dialogue_file, FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content

func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialogue_id += 1
	if current_dialogue_id >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("dialogue_finished")
		get_tree().change_scene_to_file("res://level_1.tscn")
		return 
		
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]["name"]
	$NinePatchRect/Text.text = dialogue[current_dialogue_id]["text"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
