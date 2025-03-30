extends Label

@export var text_speed: float = 0.05  # Time between characters (in seconds)
var current_text: String = ""
var target_text: String = ""

func _ready():
	target_text = text
	text = ""  # Clear the initial text
	start_typewriter_effect()

func start_typewriter_effect():
	current_text = ""
	$Timer.wait_time = text_speed
	$Timer.start()

func _on_timer_timeout():
	if current_text.length() < target_text.length():
		current_text += target_text[current_text.length()]
		text = current_text
	else:
		$Timer.stop()
