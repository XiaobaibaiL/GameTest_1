class_name Card
extends Control

const SIZE := Vector2(240, 340)

@export var text : String
@onready var laber: Label = $CardUi/Label

func _ready() -> void:
	laber.text = text
