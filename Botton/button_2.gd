extends Button

func _ready():
	get_node("../Signal1").signal1.connect(_button_output)


func _button_output(a,_b):
	print(a)
