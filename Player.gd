extends CharacterBody3D
@export var movement_speed : float = 200
@export var sprint_speed : float = 500
@export var sneak_speed : float = 100
var character_direction : Vector3

@onready var camera = $Camera3D
var rayOrigin = Vector3()
var rayEnd = Vector3()
var WASDdirection = 0

@onready var flashlight = $RotatingPart
@export var start_flashlight: bool = true  #
var can_move: bool = true

# turn on the flashlight until it is found
func _ready():
	flashlight.visible = start_flashlight	
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	#setting player movement to stop during cutscenes
	if argument == "cantmove":
		can_move = false
	if argument == "canmove":
		can_move = true
	if argument == "flashlight":
		flashlight.visible = true





func _physics_process(delta):
	if not can_move:
		velocity = Vector3.ZERO
		move_and_slide() 
		return  # cant move, leaving this process

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
	
	
	if character_direction.x:
		WASDdirection = character_direction.x * 2 * 0.7854
	
	if character_direction.z:
		WASDdirection = (character_direction.z - 1) * 2 * 0.7854
		
	if character_direction.x and character_direction.z:
		if character_direction.x == 1: #right
			if character_direction.z == 1: #up-right
				WASDdirection = 1 * 0.7854
			if character_direction.z == -1: #down-rigth
				WASDdirection = 3 * 0.7854
		if character_direction.x == -1: #left
			if character_direction.z == 1: #up-left
				WASDdirection = -1 * 0.7854
			if character_direction.z == -1: #down-left
				WASDdirection = -3 * 0.7854
	
	$WASDrotation.set_rotation(Vector3(0, WASDdirection, 0))
	
	var speed = 0
	if Input.is_action_pressed("sprint"):
		Globals.player_is_sprinting = true
		Globals.player_is_walking = false
		Globals.player_is_sneaking = false
		Globals.player_is_idle = false
		
		speed = sprint_speed
	elif Input.is_action_pressed("sneak"):
		Globals.player_is_sprinting = false
		Globals.player_is_walking = false
		Globals.player_is_sneaking = true
		Globals.player_is_idle = false
		
		speed = sneak_speed
	else:
		Globals.player_is_sprinting = false
		Globals.player_is_walking = true
		Globals.player_is_sneaking = false
		Globals.player_is_idle = false
		
		speed = movement_speed
	
	if !character_direction.x and !character_direction.z:
		Globals.player_is_sneaking = false
		Globals.player_is_walking = false
		Globals.player_is_sprinting = false
		Globals.player_is_idle = true
	
	if character_direction:
		velocity = character_direction * speed
	else:
		velocity = velocity.move_toward(Vector3.ZERO, speed)
	
	Globals.player_position = global_position
	
	
	move_and_slide()
