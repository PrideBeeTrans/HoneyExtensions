extends EaseBase


func ease_in(value: float) -> float:
	return abs(cos(value * PI * 0.5))


func ease_out(value: float) -> float:
	return 1- abs(cos(value * PI * 0.5))


func ease_in_out(value: float) -> float:
	return 2 * abs(value - round(value))


func ease_out_in(value: float) -> float:
	return 1 -2 * abs(value - round(value))
