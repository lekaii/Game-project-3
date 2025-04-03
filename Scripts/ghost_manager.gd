extends Node3D

@export var ghost_event: PackedScene
@export var ghost: PackedScene

#func _ready():
	#if Dialogic.signal_event.is_connected(_on_dialogic_signal):
		#Dialogic.signal_event.disconnect(_on_dialogic_signal)
	#Dialogic.signal_event.connect(_on_dialogic_signal)

#func _on_dialogic_signal(argument:String):
	#if argument == "ghostevent":
		#spawn_ghost_event()
		
