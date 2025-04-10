extends Node3D

func _process(delta):
	if Input.is_action_just_pressed("change_scene"):
		visible = true
