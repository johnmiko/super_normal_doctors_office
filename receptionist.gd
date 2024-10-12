extends Node3D

var is_chatting = false
var player
var player_in_chat_zone = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#randomize()
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("chat"):
		print("chatting with npc")
		is_chatting = true
		$Dialogue.start()


func _on_chat_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false


func _on_timer_timeout():
	$Timer.wait_time = 1
	


func _on_dialogue_dialogue_finished():
	is_chatting = false
	
