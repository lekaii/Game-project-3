extends Node

var current_music: AudioStreamPlayer
@onready var music_lobby = $AudioStreamPlayer1
@onready var music_rooms1 = $AudioStreamPlayer2
@onready var music_safe = $AudioStreamPlayer3
@onready var music_rooms2 = $AudioStreamPlayer4

func _ready():
	#current_music = 
	music_lobby.volume_db = -80  # Start at full volume
	music_rooms1.volume_db = -80  # Start muted
	music_rooms2.volume_db = -80  # Start muted
	music_safe.volume_db = -80  # Start muted
	#music_lobby.play() could changed to play all at the start if needed to sync

func crossfade_to(new_music: AudioStreamPlayer):
	if current_music == new_music:
		return  # No need to crossfade if already playing

	var tween = create_tween()
	tween.tween_property(new_music, "volume_db", 0, 1.0)  # Fade in, duration 05.sec
	tween.tween_property(current_music, "volume_db", -80, 1.0)  # Fade out, duration 0.5sec
	
	
	if not new_music.playing:
		new_music.play()  # If area is entered first time, song is loaded
	
	#await tween.finished  # Wait fade-out to compl
	current_music = new_music

# Create these for new areas as needed

func _on_area_1_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		crossfade_to(music_lobby)


func _on_area_2_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		if str(Dialogic.VAR.roomsAreSafe).to_lower() == "true":
			crossfade_to(music_rooms1)
		else:
			music_rooms1.stop()
			crossfade_to(music_rooms2)


func _on_area_3_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		crossfade_to(music_safe)
