extends CharacterBody3D

@export var max_movement_speed : float = 2.0
@export var locked_y_position : float = 0.0
var character_direction : Vector3
var can_move = false
var movement_speed = 0.0
@export var ghostgroup = 0

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _physics_process(delta):
	character_direction = Globals.player_position-position
	
	position.y = locked_y_position
	
	if can_move:
		movement_speed = max_movement_speed
	else:
		movement_speed = 0.0
	
	if character_direction:
		character_direction.y = 0
		character_direction = character_direction.normalized()
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector3.ZERO, movement_speed)
	
	var horizontal_player_pos = Globals.player_position
	horizontal_player_pos.y = position.y
	look_at(horizontal_player_pos, Vector3.UP)
	rotate_object_local(Vector3.UP, deg_to_rad(0))
	
	move_and_slide()
	
func _on_dialogic_signal(argument:String):
	if argument == "StartGhost1" and ghostgroup == 1:
		$".".visible = true
		can_move = true
	elif argument == "KillGhost1" and ghostgroup == 1:
		queue_free()
	elif argument == "StartGhost2" and ghostgroup == 2:
		$".".visible = true
		can_move = true
	elif argument == "KillGhost2" and ghostgroup == 2:
		queue_free()
	elif argument == "StartGhost3" and ghostgroup == 3:
		$".".visible = true
		can_move = true
	elif argument == "KillGhost3" and ghostgroup == 3:
		queue_free()
	elif argument == "StartGhost4" and ghostgroup == 4:
		$".".visible = true
		can_move = true
	elif argument == "KillGhost4" and ghostgroup == 4:
		queue_free()
		#$".".visible = false
		#can_move = false
		#global_position = get_node("/root/Hotel/GhostSpawn").global_position


func _on_killzone_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") && str(Dialogic.VAR.maze).to_lower() == "false":
		if body.is_in_group("Player") && str(Dialogic.VAR.intermissiondone).to_lower() == "false":
			body.global_position = get_node("/root/Hotel/Checkpoint").global_position
			Dialogic.start("Death")
			#killPlayer()
		elif body.is_in_group("Player") && str(Dialogic.VAR.intermissiondone).to_lower() == "true":
			body.global_position = get_node("/root/Hotel/Checkpoint_Safe").global_position
			Dialogic.start("Death")

#func killPlayer():
	#get_tree().change_scene_to_file("res://Scenes/Hotel.tscn")
	
