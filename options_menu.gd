extends Control



func _on_volume_pressed() -> void:
	pass # Replace with function body.


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_dev_level_pressed() -> void:
	get_tree().change_scene_to_file("res://Mainscene.tscn")


func _on_maze_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Maze.tscn")


func _on_ending_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Ending.tscn")
