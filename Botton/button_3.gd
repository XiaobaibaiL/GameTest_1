extends Button

func _ready():
	get_node("../Signal1").signal1.connect(_button_print)
	
func _button_print(_a,b):
	print(b)
