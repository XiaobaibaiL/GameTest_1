extends Button

func wait_signal():
	print("等待Signal")
	await get_node("../Button4").button_down
	print("收到Signal")
	return true

func _ready():
	pass

func _pressed():
	if get_node("../Button1").button_down:
		await wait_signal()
