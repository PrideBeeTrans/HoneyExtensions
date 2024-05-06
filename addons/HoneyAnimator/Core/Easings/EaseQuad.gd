extends EaseBase


func ease_in(value: float) -> float:
	return value * value


func ease_out(value: float) -> float:
	return 1- (1- value) * (1 * value)


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return 2 * value * value
	else:
		return 1- pow(-2 * value + 2, 2) / 2


func ease_out_in(value: float) -> float:
	if value < 0.5:
		return 1- pow(-2 * value + 2, 2) / 2
	else:
		return 2 * value * value
