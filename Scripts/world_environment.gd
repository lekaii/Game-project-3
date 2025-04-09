extends WorldEnvironment

#sets the exposure
func _ready():
	var exposure := Globals.darkness  
	if environment:
		environment.tonemap_exposure = exposure
