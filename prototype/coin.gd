extends Area3D

const ROT_SPEED = 2
const MOVE_SPEED = 2
const MAX_HEIGHT = 0.5   # usually small looks better for coins

var base_y: float

func _ready() -> void:
	base_y = global_transform.origin.y

func _process(delta):
	# Rotate the coin
	rotate_y(deg_to_rad(ROT_SPEED))

	# Floating motion
	var offset = sin(Time.get_ticks_msec() / 1000.0 * MOVE_SPEED) * MAX_HEIGHT
	var pos = global_transform.origin
	pos.y = base_y + offset
	global_transform.origin = pos

func _on_body_entered(body):
	queue_free()
