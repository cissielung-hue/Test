extends Area3D

const ROT_SPEED = 2 #Degree the coin will rotates every frame

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED))
		
		
		
func _on_body_entered(body):
	queue_free()
