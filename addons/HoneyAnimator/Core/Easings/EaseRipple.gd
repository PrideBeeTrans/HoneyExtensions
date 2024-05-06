extends EaseBase


func ease_in(value: float) -> float:
	return 1- sqrt(1- value * value * value)


func ease_out(value: float) -> float:
	return sqrt(1- (1- value) * (1- value))


func ease_in_out(value: float) -> float:
	return value * sin(value * 2 * PI) / (2 * PI)


func ease_out_in(value: float) -> float:
	return 1 - (value - sin((1- value) * 2 * PI) / (2 * PI))
