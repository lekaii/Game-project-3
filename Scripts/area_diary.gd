extends Area3D

@onready var glow = $InteractGlow

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument:String):
	if argument == "area_diary":
		glow.visible = true
	if argument == "area_diary_off":
		glow.visible = false
