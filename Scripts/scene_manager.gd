extends Node

func _process(delta):
	if Input.is_action_just_pressed("change_scene"):
		get_tree().change_scene_to_file("res://scenes/hotel.tscn")
