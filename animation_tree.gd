extends Node3D

enum {IDLE, RUN, SNEAK, WALK, DEAD}
var curAnim = RUN

@onready var anim_tree = $AnimationTree
@onready var blend_speed = 15 

var run_val = 0
var walk_val = 0
var sneak_val = 0
var die_val = 0

func _physics_process(delta):
	handle_animations(delta)
	
	
	if Globals.player_is_sprinting:
		curAnim = RUN
		print("run")
	
	if Globals.player_is_walking:
		curAnim = WALK
		print("walk")
	
	if Globals.player_is_sneaking:
		curAnim = SNEAK
		print("sneak")
	
	if Globals.player_is_dead:
		curAnim = DEAD
		print("dead")
	
	if Globals.player_is_idle:
		curAnim = IDLE
		print("idle")
	

func handle_animations(delta):
	match curAnim:
			IDLE:
				run_val = lerpf(run_val,0,blend_speed*delta)
				walk_val = lerpf(walk_val,0,blend_speed*delta)
				sneak_val = lerpf(sneak_val,0,blend_speed*delta)
				die_val = lerpf(die_val,0,blend_speed*delta)
			RUN:
				run_val = lerpf(run_val,1,blend_speed*delta)
				walk_val = lerpf(walk_val,0,blend_speed*delta)
				sneak_val = lerpf(sneak_val,0,blend_speed*delta)
				die_val = lerpf(die_val,0,blend_speed*delta)
			WALK:
				run_val = lerpf(run_val,0,blend_speed*delta)
				walk_val = lerpf(walk_val,1,blend_speed*delta)
				sneak_val = lerpf(sneak_val,0,blend_speed*delta)
				die_val = lerpf(die_val,0,blend_speed*delta)
			SNEAK:
				run_val = lerpf(run_val,0,blend_speed*delta)
				walk_val = lerpf(walk_val,0,blend_speed*delta)
				sneak_val = lerpf(sneak_val,1,blend_speed*delta)
				die_val = lerpf(die_val,0,blend_speed*delta)
			DEAD:
				run_val = lerpf(run_val,0,blend_speed*delta)
				walk_val = lerpf(walk_val,0,blend_speed*delta)
				sneak_val = lerpf(sneak_val,0,blend_speed*delta)
				die_val = lerpf(die_val,1,blend_speed*delta)
			

func update_tree():
	anim_tree["parameters/Run/blend_amount"] = run_val
	anim_tree["parameters/Walk/blend_amount"] = walk_val
	anim_tree["parameters/Sneak/blend_amount"] = sneak_val
	anim_tree["parameters/Die/blend_amount"] = die_val
	
