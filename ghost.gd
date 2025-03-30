extends CharacterBody3D

@export var movement_speed : float = 2.0
@export var locked_y_position : float = 0.0
var character_direction : Vector3

func _physics_process(delta):
	character_direction = Globals.player_position-position
	
	position.y = locked_y_position
	
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
