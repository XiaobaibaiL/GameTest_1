extends Button

signal signal3(str_1)

func _ready():
	get_node("../Signal1").signal1.connect(_button_print)
	get_node("../Button2").signal2.connect(_button_print2)
	
	self.button_down.connect(out_signal)
	
func _button_print(_a,b):
	print(b)

func _button_print2(a):
	print(a)
	
func out_signal():
	emit_signal("signal3","按下了按钮")
