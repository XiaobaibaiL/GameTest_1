extends Line2D

func _process(delta: float) -> void:
	var player2 = get_parent().find_child("Player2")
	var position = player2.position
	add_point(position)
	if(get_point_count() >= 60):
		remove_point(0)
	pass
	
