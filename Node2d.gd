extends Node


func _ready():
	$Button1.button_down.connect(_button_down)
	

func _button_down():
	print("hallow")
