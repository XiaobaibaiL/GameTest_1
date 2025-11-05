class_name Hand
extends ColorRect

const CARD = preload("res://CardGame/CardUI/CardUI.tscn")

#导入Hand分布曲线和旋转曲线
@export var hand_curvc :Curve
@export var rotation_curvc:Curve

#最大旋转度数
@export var max_rotation_degress := 5
#卡牌默认间隔（单位：像素），正数意味着卡牌之间有空隙，负值则是卡片会挤在一起
@export var x_sep := -10
#基于手牌位置的Y轴偏移量
@export var y_min := 0
@export var y_max := -15

func darw():
	var new_card = CARD.instantiate()
	new_card.text = "卡牌 %s" %(get_child_count() + 1)
	add_child(new_card)
	_updata_cards()
	
func discard():
	pass
