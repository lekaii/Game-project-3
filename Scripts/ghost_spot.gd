extends CharacterBody3D

func _ready():
	if Dialogic.signal_event.is_connected(_on_dialogic_signal):
		Dialogic.signal_event.disconnect(_on_dialogic_signal)
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "spotvisible":
		visible = true
	if argument == "spotinvisible":
		visible = false
