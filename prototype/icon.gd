extends Sprite3D
var coins = 5
var play_name = "box"
var hearts = 3
const SPEED = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		rotate_y(deg_to_rad(-SPEED))
	elif Input.is_action_pressed("right"):
		rotate_y(deg_to_rad(SPEED))
	else:
		rotate_z(deg_to_rad(SPEED))
