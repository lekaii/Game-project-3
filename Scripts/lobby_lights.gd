extends Node

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "hotel_lights":
		for child in get_children():
			if child is Light3D:  
				child.visible = false  # Turn off the light
				if child.name == "safety" || child.name == "safety2":
					child.visible = true
