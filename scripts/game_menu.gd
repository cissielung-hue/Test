extends Control

@onready var pause_menu: Control = $"Pause Menu"
@onready var settings: Panel = $"Pause Menu/Settings"
@onready var pause_buttons: VBoxContainer = $"Pause Menu/Background/Pause Buttons"

func _ready():
	pause_menu.visible = false


func _input(event):
	if event.is_action_pressed("quit"):
		if !get_tree().paused:
			# Game is running → open pause menu
			toggle_pause()
		else:
			# Game is paused → ESC should close menus or resume
			handle_pause_escape()
func handle_pause_escape():
	if settings.visible:
		# ESC closes settings and returns to main pause buttons
		settings.visible = false
		pause_buttons.visible = true
	else:
		# ESC resumes the game
		get_tree().paused = false
		pause_menu.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused

	if get_tree().paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	pause_buttons.visible = true
	settings.visible = false


func _on_resume_pressed():
	get_tree().paused = false
	pause_menu.visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_settings_pressed():
	pause_buttons.visible = false
	settings.visible = true


func _on_back_settings_pressed():
	pause_buttons.visible = true
	settings.visible = false


func _on_main_menu_pressed():
	get_tree().paused = false
	var loader = load("res://scenes/loading.tscn").instantiate()
	get_tree().current_scene.add_child(loader)
	loader.start_loading("res://scenes/main_menu.tscn")


func _on_resume_2_pressed():
	print("restarted")
