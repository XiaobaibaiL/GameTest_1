extends Button

signal signal2(tem)

func _ready():
	get_node("../Signal1").signal1.connect(_button_output)
	get_node("../Button3").signal3.connect(_output_text)
	
	self.button_down.connect(_output)


func _output():
	emit_signal("signal2",666)

func _button_output(a,_b):
	print(a)
	
func _output_text(str_1):
	print(str_1)
