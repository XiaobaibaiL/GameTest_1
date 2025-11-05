extends Control

@onready var hand: Hand = $Hand

func _on_drew_a_card_button_pressed():
	hand.draw()
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	
func _on_discard_card_button_pressed():
	hand.discard()
