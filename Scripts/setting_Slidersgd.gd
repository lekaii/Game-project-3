extends VBoxContainer

@onready var slider: HSlider = $VSlider
@onready var label: Label = $Label

func _ready():
	slider.value = Globals.darkness
	_update_label(slider.value)

	# Connect value_changed signal
	slider.connect("value_changed", _update_label)

func _update_label(value: float) -> void:
	# Display with 2 decimal places
	label.text = str(round(value * 100) / 100.0)
	Globals.darkness = slider.value
