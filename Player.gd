extends CharacterBody3D
@export var movement_speed : float = 500
var character_direction : Vector3

func _physics_process(delta):
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.z = Input.get_axis("move_up", "move_down")
	
	if character_direction:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector3.ZERO, movement_speed)
	
	Globals.player_position = global_position
	
	print(Globals.player_position)
	
	move_and_slide()
