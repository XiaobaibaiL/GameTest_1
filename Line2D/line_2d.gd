extends Line2D

func _process(_delta):
	var player = get_parent().find_child("Player")
	position = player.position
	add_point(position)
	if(get_point_count() >= 60):
		remove_point(0)
	pass
	print("Line：",position)
