extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_next_pressed() -> void:
	get_tree().change_scene_to_file("res://credits_menu2.tscn")
