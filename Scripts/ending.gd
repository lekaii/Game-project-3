extends Node

@onready var video_player = $VideoStreamPlayer
@onready var bg = $CanvasLayer/ColorRect
@onready var lines = [
	$CanvasLayer/VBoxContainer/Label,
	$CanvasLayer/VBoxContainer/Label2,
	$CanvasLayer/VBoxContainer/Label3,
	$CanvasLayer/VBoxContainer/Label4,
	$CanvasLayer/VBoxContainer/Label5
]

func _ready():
	if Dialogic.signal_event.is_connected(_on_dialogic_signal):
		Dialogic.signal_event.disconnect(_on_dialogic_signal)
	Dialogic.signal_event.connect(_on_dialogic_signal)
	bg.anchor_left = 0
	bg.anchor_top = 0
	bg.anchor_right = 1
	bg.anchor_bottom = 1
	bg.color = Color.BLACK
	Dialogic.start("ending")

func _on_dialogic_signal(argument:String):
	if argument == "playvideo":
		bg.visible = false
		video_player.play()
		print("Video started!")

func _on_video_stream_player_finished() -> void:
	print("Video finished!")
	video_player.visible = false  # hide after playing
	bg.color = Color.WHITE
	bg.visible = true        # now visible since video is hidden
	reveal_lines()



func reveal_lines():
	var delay = 1.5  # delay between lines
	for line in lines:
		line.modulate.a = 0.0
		line.visible = true
		var tween = create_tween()
		tween.tween_property(line, "modulate:a", 1.0, 2.0).set_trans(Tween.TRANS_SINE)
		await tween.finished
		await get_tree().create_timer(delay).timeout

	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://credits_menu.tscn")
