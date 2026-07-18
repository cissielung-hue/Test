extends Node3D

var target_y: float = 0.0
const MODEL_CORRECTION = deg_to_rad(0)

func rotate_toward_direction(direction: Vector3, delta: float) -> void:
	if direction.length() > 0.1:
		target_y = atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, target_y - MODEL_CORRECTION, delta * 10.0)
