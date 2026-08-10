extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_respawn_pressed() -> void:
	var loader = load("res://scenes/loading.tscn").instantiate()
	get_tree().current_scene.add_child(loader)
	loader.start_loading("res://scenes/forest.tscn")


func _on_back_to_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
