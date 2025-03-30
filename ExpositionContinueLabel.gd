extends Label

@export var delayed_text := "Hello World!"
@export var delay_seconds := 2.0
@export var fade_duration := 0.5

func _ready():
	modulate.a = 0  # Start invisible
	text = delayed_text
	
	var tween = create_tween()
	tween.tween_interval(delay_seconds)  # Wait before showing
	tween.tween_property(self, "modulate:a", 1.0, fade_duration)
