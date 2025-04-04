extends Control

func _on_ready():
	preload("res://Scenes/Hotel.tscn")

func _on_play_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://exposition.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://options_menu.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
	

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://credits_menu.tscn")
