extends Node3D


func _ready():
	if Dialogic.signal_event.is_connected(_on_dialogic_signal):
		Dialogic.signal_event.disconnect(_on_dialogic_signal)
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "painting_open":
		move_door()
	if argument == "movetomaze":
		get_tree().change_scene_to_file("res://main_menu.tscn")


# opens or closes the door, plays sound
func move_door():
	var tween = create_tween()
	#tween.tween_property(self, "rotation", Vector3(0, deg_to_rad(100), 0), 0.5)
	var slide_distance = 2.0
	var target_position = global_transform.origin + Vector3(slide_distance, 0, 0)  
	tween.tween_property(self, "global_transform:origin", target_position, 0.5)
