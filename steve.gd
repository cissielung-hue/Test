extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var mouse_sensibility: float = 0.02

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "up", "down")
	var cam := $CameraPivot/SpringArm3D

	var cam_forward: Vector3 = cam.global_transform.basis.z
	var cam_right: Vector3 = cam.global_transform.basis.x

	var direction := (cam_forward * input_dir.y + cam_right * input_dir.x).normalized()

	# Running system
	var run_multiplier := 1.0
	if Input.is_action_pressed("run"):
		run_multiplier = 2.0


	# Apply movement
	if direction:
		velocity.x = direction.x * SPEED * run_multiplier
		velocity.z = direction.z * SPEED * run_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	# Rotate rabbit to match camera
	# Rotate ONLY the rabbit mesh
	$Rabbit.rotate_toward_direction(direction, delta)

	move_and_slide()


func _on_fall_zone_body_entered(body: Node3D) -> void:
	get_tree().change_scene_to_file("res://main.tscn")
