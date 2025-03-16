extends CharacterBody2D
@export var speed = 90

func _physics_process(delta):
	var direction=(Globals.player_position-position).normalized()
	velocity = direction * speed
	look_at(Globals.player_position)
	move_and_slide()
