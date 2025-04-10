extends Node


func _on_aree_entrance_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.maze).to_lower() == "false":
		Dialogic.start("maze_entrance")


func _on_area_ghost_5_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.ghost5).to_lower() == "false" && str(Dialogic.VAR.ghost5dead).to_lower() == "false":
		Dialogic.start("ghost5")


func _on_area_exit_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/Ending.tscn")


func _on_area_ghost_6_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.ghost6).to_lower() == "false" && str(Dialogic.VAR.ghost6dead).to_lower() == "false":
		Dialogic.start("ghost6")
