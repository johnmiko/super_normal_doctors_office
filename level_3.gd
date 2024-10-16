extends Node3D

var initial_position
var other_position
var stairs3

# Called when the node enters the scene tree for the first time.
func _ready():
	stairs3 = get_node("./StairGroup1/Stairs/Stairs3")	
	initial_position = stairs3.position
	other_position = stairs3.position
	other_position.y -= 20
		#var invis_floor = get_node("../InvisibleFloorStaticBody3D/CollisionShape3D")		
		#invis_floor.disabled = true 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	#if has_overlapping_bodies():
		var player = get_node("./player")
		var camera = get_node("./player/Camera")
		#var a = camera.get_attributes()
		#var b = camera.get_camera_projection()
		var look_dir = camera.global_transform.basis.z
		var player_is_looking_backwards = look_dir.z < -0.5				
		if player_is_looking_backwards:
			stairs3.position = initial_position
			#print("door is invisible")
		else:
			stairs3.position =  other_position
			#print("door is visible")			
		# look forward is z=1 or about 1
		# looking backwards is z=-1
		#print(look_dir)
		#player.position
		#var position = player.position
		#print(player.position)
		#var new_position = Vector3(position.x, 3, position.z)
		#player.position = new_position
		#print(player.position)
		#$Player.global_position
		#get_tree().change_scene_to_file("res://level_1.5.tscn")

