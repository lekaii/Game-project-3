extends CharacterBody3D

@export var movement_speed : float = 2.0
var character_direction : Vector3

func _physics_process(delta):
	character_direction = Globals.player_position-position
	
	if character_direction:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector3.ZERO, movement_speed)
	
	look_at(Globals.player_position, Vector3.UP)
	rotate_object_local(Vector3.UP, deg_to_rad(0))
	
	move_and_slide()
