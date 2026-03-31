extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var mouse_sensibility: float = 0.02

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation.y -= event.relative.x * mouse_sensibility


		
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
	var cam := $SpringArm3D

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
	if direction.length() > 0.2:
		var cam_y = cam.global_rotation.y
		rotation.y = lerp_angle(rotation.y, cam_y, delta * 10.0)

	move_and_slide()
