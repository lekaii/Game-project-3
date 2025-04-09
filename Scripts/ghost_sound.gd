extends AudioStreamPlayer3D

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	
func _on_dialogic_signal(argument:String):
	var ghost_group = get_parent().ghostgroup
	if argument == "StartGhost1" && ghost_group == 1:
		play()
	if argument == "KillGhost1" && ghost_group == 1:
		stop()
	if argument == "StartGhost2" && ghost_group == 2:
		play()
	if argument == "KillGhost2" && ghost_group == 2:
		stop()
	if argument == "StartGhost3" && ghost_group == 3:
		play()
	if argument == "KillGhost3" && ghost_group == 3:
		stop()
	if argument == "StartGhost4" && ghost_group == 4:
		play()
	if argument == "KillGhost4" && ghost_group == 4:
		stop()
