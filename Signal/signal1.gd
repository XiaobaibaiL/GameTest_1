extends Button

signal signal1(a,b)

func _ready():
	self.button_down.connect(output_signal)
	
func output_signal():
	emit_signal("signal1",1,2)
