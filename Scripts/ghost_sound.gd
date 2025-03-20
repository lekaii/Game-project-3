extends AudioStreamPlayer3D

@export var player: Node3D #drag player object in inspector to here

func _process(delta):
	#volume drops of farther the player is
	if player:
		var distance = global_position.distance_to(player.global_position)
		volume_db = linear_to_db((1.0 / max(distance, 1))**2) #modify or remove exponent to change volume drop-off
