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


func _on_areadoor_roomevent_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.roomevent).to_lower() == "false":
		Dialogic.start("room_event")

# if chase hasn't happened but player is leaving room after room event
func _on_area_chase_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.chasedone).to_lower() == "true" && str(Dialogic.VAR.chasestarted).to_lower() == "false":
		Dialogic.start("chase_event")


func _on_area_saferoom_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Dialogic.start("saferoom")


func _on_area_phone_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.phonedone).to_lower() == "false":
		Dialogic.start("phonecall")


func _on_area_newspaper_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.paintingkey).to_lower() == "false":
		Dialogic.start("newspaper")


func _on_area_key_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.breakroomkey).to_lower() == "false":
		Dialogic.start("area_key")


func _on_area_note_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Dialogic.start("area_note")


func _on_area_painting_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.paintingkey).to_lower() == "true" && str(Dialogic.VAR.paintingopen).to_lower() == "false":
		Dialogic.start("painting")


func _on_area_passage_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Dialogic.start("passage")


func _on_area_diary_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		Dialogic.start("area_diary")


func _on_area_ghost_2_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.ghost2).to_lower() == "false" && str(Dialogic.VAR.ghost2dead).to_lower() == "false":
		Dialogic.start("ghost2")


func _on_area_ghost_3_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.ghost3).to_lower() == "false" && str(Dialogic.VAR.ghost3dead).to_lower() == "false":
		Dialogic.start("ghost3")


func _on_area_ghost_4_body_entered(body: Node3D) -> void:
	if body.name == "Player" && str(Dialogic.VAR.ghost4).to_lower() == "false" && str(Dialogic.VAR.ghost4dead).to_lower() == "false":
		Dialogic.start("ghost4")
