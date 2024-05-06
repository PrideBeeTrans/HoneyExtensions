extends EaseBase


func ease_in(value: float) -> float:
	return value * value * value * value * value


func ease_out(value: float) -> float:
	return 1- pow(1 - value, 5)


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return 16 * value * value * value * value * value
	else:
		return 1- pow(-2 * value +2, 5) / 2


func ease_out_in(value: float) -> float:
	if value < 0.5:
		return 1- pow(-2 * value +2, 5) / 2
	else:
		return 16 * value * value * value * value * value
