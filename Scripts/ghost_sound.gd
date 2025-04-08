extends AudioStreamPlayer3D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(argument:String):
	var ghost_group = get_parent().ghostgroup
	if argument == "StartGhost1" && ghost_group == 1:
		play()
	if argument == "KillGhost1" && ghost_group == 1:
		stop()
