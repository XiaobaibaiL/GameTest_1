class_name Hand
extends ColorRect

const CARD = preload("res://CardGame/CardUI/CardUI.tscn")

#导入Hand分布曲线和旋转曲线
@export var hand_curvc :Curve
@export var rotation_curvc:Curve

#最大旋转度数
@export var max_rotation_degress := 10
#卡牌默认间隔（单位：像素），正数意味着卡牌之间有空隙，负值则是卡片会挤在一起
@export var x_sep := -10
#基于手牌位置的Y轴偏移量
@export var y_min := 0
@export var y_max := -15

func darw():
	var new_card = CARD.instantiate()
	new_card.text = "卡牌 %s" %(get_child_count() + 1)
	add_child(new_card)
	_update_cards()
	
func discard():
	if get_child_count() < 1:
		return
	
	var child := get_child(-1)
	child.reparent(get_tree().root)
	child.queue_free()
	_update_cards()
	
func _update_cards():
	var cards := get_child_count()
	var all_cards_size := Card.SIZE.x * cards + x_sep * (cards - 1)
	var final_x_sep : float = x_sep
	
	if all_cards_size > size.x:
		final_x_sep = (size.x - Card.SIZE.x * cards) / (cards - 1)
		all_cards_size = size.x
	
	var offset := (size.x - all_cards_size) / 2

	for i in cards:
		var card := get_child(i)
		var y_multiplier := hand_curvc.sample(1.0 / (cards - 1) * i)
		var rot_multiplier := rotation_curvc.sample(1.0 / (cards - 1) * i)
		
		if cards == 1:
			y_multiplier = 0.0
			rot_multiplier = 0.0
			
		var final_x: float = offset + Card.SIZE.x * i + final_x_sep * i
		var final_y: float = y_min + y_max * y_multiplier
		
		card.position = Vector2(final_x,final_y)
		card.rotation_degrees = max_rotation_degress * rot_multiplier
