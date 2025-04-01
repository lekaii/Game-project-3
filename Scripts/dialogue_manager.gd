extends Node


func _on_area_custodian_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Dialogic.start("Custodian")


#signal player_near_door(door, is_near)

#func _on_body_entered(body, door):
#	if body.is_in_group("player"):
#		player_near_door.emit(door, true)  # Tell the door the player is near

#func _on_body_exited(body, door):
#	if body.is_in_group("player"):
#		player_near_door.emit(door, false)  # Tell the door the player left###
