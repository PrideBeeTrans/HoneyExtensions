extends EaseBase


func ease_in(value: float) -> float:
	return 1 - cos(value * PI / 2)


func ease_out(value: float) -> float:
	return sin(value * PI / 2)


func ease_in_out(value: float) -> float:
	return -0.5 * (cos(PI * value) - 1)


func ease_out_in(value: float) -> float:
	return 0.5 * sin(PI * (value + 0.5))
