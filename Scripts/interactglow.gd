extends OmniLight3D

var base_energy = 0.5

func _process(delta):
	light_energy = base_energy + sin(Time.get_ticks_msec() * 0.005) * 0.5
