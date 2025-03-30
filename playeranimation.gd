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
	if Globals.player_is_dead:
		anim_tree.set("parameters/Die/blend_amount", 1.0)
		anim_tree.set("parameters/Run/blend_amount", 0.0)
		anim_tree.set("parameters/Sneak/blend_amount", 0.0)
		anim_tree.set("parameters/Walk/blend_amount", 0.0)
	elif Globals.player_is_sprinting:
		anim_tree.set("parameters/Die/blend_amount", 0.0)
		anim_tree.set("parameters/Run/blend_amount", 1.0)
		anim_tree.set("parameters/Sneak/blend_amount", 0.0)
		anim_tree.set("parameters/Walk/blend_amount", 0.0)
	elif Globals.player_is_walking:
		anim_tree.set("parameters/Die/blend_amount", 0.0)
		anim_tree.set("parameters/Run/blend_amount", 0.0)
		anim_tree.set("parameters/Sneak/blend_amount", 0.0)
		anim_tree.set("parameters/Walk/blend_amount", 1.0)
	elif Globals.player_is_sneaking:
		anim_tree.set("parameters/Die/blend_amount", 0.0)
		anim_tree.set("parameters/Run/blend_amount", 0.0)
		anim_tree.set("parameters/Sneak/blend_amount", 1.0)
		anim_tree.set("parameters/Walk/blend_amount", 0.0)
	else:
		anim_tree.set("parameters/Die/blend_amount", 0.0)
		anim_tree.set("parameters/Run/blend_amount", 0.0)
		anim_tree.set("parameters/Sneak/blend_amount", 0.0)
		anim_tree.set("parameters/Walk/blend_amount", 0.0)
		
