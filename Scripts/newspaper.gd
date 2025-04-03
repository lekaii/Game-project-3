extends Node3D

@onready var glow = $InteractGlow

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "newspaperglow":
		glow.visible = true
	
