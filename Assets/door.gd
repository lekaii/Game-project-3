extends Node3D

@onready var audio_player = $AudioStreamPlayer3D
@onready var audio_player2 = $AudioStreamPlayer3D2
@export var door_name: String = "default_door"  # write door name in editor here
@onready var prompt_text = $Label3D  # Text label
@onready var prompt_text2 = $Label3D2  # Text label


var is_open = false
var player_near = false
var closed_rotation = Vector3(0, deg_to_rad(-90), 0)
var open_rotation = Vector3(0, deg_to_rad(70), 0)

func _ready():
	if Dialogic.signal_event.is_connected(_on_dialogic_signal):
		Dialogic.signal_event.disconnect(_on_dialogic_signal)
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == door_name:
		move_door()



func _input(event):
	if player_near and event is InputEventKey and event.pressed and event.keycode == KEY_E:
		prompt_text.visible = false
		prompt_text2.visible = false
		Dialogic.start(door_name)

# opens or closes the door, plays sound
func move_door():
	var tween = create_tween()
	var target_rotation = open_rotation if not is_open else closed_rotation
	
	# Special case so player wont be yeeted outside the map!
	if door_name != "hotel_6" && door_name != "safe_south":
		tween.tween_property(self, "rotation", target_rotation, 0.5)
	else:
		tween.tween_property(self, "rotation", Vector3(0, deg_to_rad(-180), 0), 0.5)
	
	if !is_open:
		audio_player.play()
	else:
		audio_player2.play()
	
	is_open = !is_open  # Toggle state


func _on_hotel_13_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_13_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false


func _on_hotel_6_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_6_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false

func _on_hotel_5_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_5_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false


func _on_hotel_3_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_3_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false


func _on_hotel_2_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_2_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false


func _on_hotel_4_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_4_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false


func _on_hotel_1_area_body_entered(body: Node3D) -> void:
	if body.name == "Player" && !is_open:
		prompt_text.visible = true
		prompt_text2.visible = true
		player_near = true


func _on_hotel_1_area_body_exited(body: Node3D) -> void:
	if body.name == "Player":
		prompt_text.visible = false
		prompt_text2.visible = false
		player_near = false
