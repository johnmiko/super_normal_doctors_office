extends Area3D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Emitted when the player was hit by a mob.
# Put this at the top of the script.
signal hit


# And this function at the bottom.
func die():
	hit.emit()
	queue_free()



func _on_area_entered(area):
		die()
