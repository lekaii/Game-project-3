extends Node3D

@export var group: String = "default value"
@export var ghostspeed : float = 0.5
@export var ghost = preload("res://ghost.tscn")

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "StartGhost":
		var gho = ghost.instantiate()
		gho.position = position
