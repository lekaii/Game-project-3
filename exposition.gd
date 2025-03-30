extends Control

func _ready():
	# Create the rendering setup
	var viewport = SubViewport.new()
	viewport.size = Vector2(1024, 1024)
	viewport.transparent_bg = true  # Critical for transparency
	viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	
	var container = SubViewportContainer.new()
	container.size = Vector2(400, 400)  # UI size
	container.add_child(viewport)
	add_child(container)
	
	# Add 3D content
	var world = World3D.new()
	var env = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color.TRANSPARENT
	world.environment = env
	
	viewport.world_3d = world
	var camera = Camera3D.new()
	camera.position = Vector3(0, 0, 4)
	viewport.add_child(camera)
	
	var character = preload("res://playeranimation.tscn").instantiate()
	viewport.add_child(character)
	
	# Position the character
	character.position = Vector3(2, -0.3, 0)
	character.rotation_degrees.y = 170  # Face the camera

func _on_timer_timeout() -> void:
	pass # Replace with function body.

func _input(event):
	# Detect either Enter or Return key press
	if event.is_action_pressed("EnterOrReturn"):
		get_tree().change_scene_to_file("res://Scenes/Hotel.tscn")
