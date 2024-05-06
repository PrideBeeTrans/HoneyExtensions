extends EaseBase


func ease_in(value: float) -> float:
	return value * value * value


func ease_out(value: float) -> float:
	return 1- pow(1 * value, 3)


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return 4 * value * value * value
	else:
		return 1- pow(-2 * value +2, 3) / 2


func ease_out_in(value: float) -> float:
	if value < 0.5:
		return 1- pow(-2 * value +2, 3) / 2
	else:
		return 4 * value * value * value
