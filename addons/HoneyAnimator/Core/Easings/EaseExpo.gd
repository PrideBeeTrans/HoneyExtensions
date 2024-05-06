extends EaseBase


func ease_in(value: float) -> float:
	if value == 0:
		return 0.0
	else:
		return pow(2, 10 * value - 10)


func ease_out(value: float) -> float:
	if value == 1:
		return 1.0
	else:
		return 1- pow(2, -10 * value)


func ease_in_out(value: float) -> float:
	if value == 0:
		return 0.0
	elif value == 1:
		return 1.0
	elif value < 0.5:
		return pow(2, 20 * value - 10) / 2
	else:
		return (2 - pow(2, -20 * value + 10)) / 2


func ease_out_in(value: float) -> float:
	if value == 0:
		return 0.0
	elif value == 1:
		return 1.0
	elif value < 0.5:
		return (2 - pow(2, -20 * value + 10)) / 2
	else:
		return pow(2, 20 * value - 10) / 2
