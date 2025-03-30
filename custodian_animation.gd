extends Node3D

@onready var anim_player = $AnimationPlayer
@onready var anim_tree = $AnimationTree

func _ready():
	# Start AnimationTree
	anim_tree.active = true
	
	# Set ALL animations to loop (one-time setup)
	for anim in anim_player.get_animation_list():
		anim_player.get_animation(anim).loop_mode = Animation.LOOP_LINEAR

func _process(_delta):
	# Simple state machine using your Globals
	
	anim_tree.set("parameters/Idle/blend_amount", 1.0)
		
