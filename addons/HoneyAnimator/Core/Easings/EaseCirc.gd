extends EaseBase


func ease_in(value: float) -> float:
	return 1 - sqrt(1 - pow(value, 2))


func ease_out(value: float) -> float:
	return sqrt(1 - pow(value - 1, 2))


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return (1 - sqrt(1 - pow(2 * value, 2))) / 2
	else:
		return (sqrt(1- pow(-2 * value + 2, 2)) +1) / 2


func ease_out_in(value: float) -> float:
	if value < 0.5:
		return (sqrt(1- pow(-2 * value + 2, 2)) +1) / 2
	else:
		return (1 - sqrt(1 - pow(2 * value, 2))) / 2
