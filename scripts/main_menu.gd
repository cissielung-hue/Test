extends Control
@onready var buttons: VBoxContainer = $Buttons
@onready var settings: Panel = $Settings

#Display only the menu buttons
func _ready() -> void:
	buttons.visible = true
	settings.visible = false


#Main Buttons on Menu
#Continue on pass game
func _on_resume_pressed() -> void:
	var loader = load("res://scenes/loading.tscn").instantiate()
	get_tree().current_scene.add_child(loader)
	loader.start_loading("res://scenes/forest.tscn")

#Create new game save?
func _on_new_game_pressed() -> void:
	print("new game pressed")

#Choose a pass game save?
func _on_load_game_pressed() -> void:
	print("load game pressed")

#Open setting by showing the buttons
func _on_settings_pressed() -> void:
	print("setting pressed")
	buttons.visible = false
	settings.visible = true

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_settings_pressed() -> void:
	buttons.visible = true
	settings.visible = false
