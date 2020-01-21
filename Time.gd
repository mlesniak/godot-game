extends Label

func _process(delta):
	var timer = get_parent()
	var s = "%.2f" % timer.get_time_left()
	text = s
	