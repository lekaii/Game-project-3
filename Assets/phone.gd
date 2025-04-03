extends Node3D

@onready var audio_player = $AudioStreamPlayer3D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "phone":
		audio_player.play()
	if argument == "phoneOff":
		audio_player.stop()
