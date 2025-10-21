extends Sprite2D

var speed = 400
var angular_speed = PI

func _process(delta: float) -> void:
	rotation += angular_speed * delta
	
	var velocity = Vector2.LEFT.rotated(rotation) * speed

	position += velocity * delta
