extends CharacterBody3D
@export var movement_speed : float = 500
var character_direction : Vector3

@onready var camera = $Camera3D
var rayOrigin = Vector3()
var rayEnd = Vector3()

func _physics_process(delta):
	# Define the plane's Y-coordinate
	var plane_y = 0.0  # Change this to your desired Y-coordinate

	# Calculate the intersection point between the ray and the plane
	var plane_normal = Vector3(0, 1, 0)  # Normal for a horizontal plane
	var plane_point = Vector3(0, plane_y, 0)  # A point on the plane
	
	var mouse_position = camera.get_viewport().get_mouse_position()
	rayOrigin = camera.project_ray_origin(mouse_position)
	var rayDirection = camera.project_ray_normal(mouse_position)
	
# Calculate the denominator for the ray-plane intersection formula
	var denom = plane_normal.dot(rayDirection)
	
	var t = -1.0  # Default value to indicate no intersection

	if abs(denom) > 0.0001:  # Ensure the ray is not parallel to the plane
		t = (plane_point - rayOrigin).dot(plane_normal) / denom
	if t >= 0:  # Ensure the intersection is in front of the ray origin
		var intersection_point = rayOrigin + rayDirection * t
		# Make the Sprite3D look at the intersection point
		$RotatingPart.look_at(Vector3(intersection_point.x, transform.origin.y, intersection_point.z), Vector3(0, 1, 0))
	
	
	#Character 2D movement
	character_direction.x = Input.get_axis("move_left", "move_right")
	character_direction.z = Input.get_axis("move_up", "move_down")
	
	if character_direction:
		velocity = character_direction * movement_speed
	else:
		velocity = velocity.move_toward(Vector3.ZERO, movement_speed)
	
	Globals.player_position = global_position
	
	print(Globals.player_position)
	
	move_and_slide()
