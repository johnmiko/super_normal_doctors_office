extends Area3D

#$"../player"
# Called when the node enters the scene tree for the first time.
func _ready():
		var invis_floor = get_node("../InvisibleFloorStaticBody3D/CollisionShape3D")		
		invis_floor.disabled = true 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if has_overlapping_bodies():
		print("player hit fall area, resetting position and loading floor")
		var player = get_node("../player")
		var position = player.position
		print(player.position)
		var new_position = Vector3(position.x, 80, position.z)
		player.position = new_position
		print(player.position)
		var invis_floor = get_node("../InvisibleFloorStaticBody3D/CollisionShape3D")		
		invis_floor.disabled = false   # enable
