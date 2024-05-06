extends EaseBase

export var twists := 1.0


func ease_in(value: float) -> float:
	return sin(value * twists * 2 * PI)


func ease_out(value: float) -> float:
	return 1- sin((1 - value) * twists * 2 * PI)


func ease_in_out(value: float) -> float:
	return (1 - cos(value * twists * PI)) / 2


func ease_out_in(value: float) -> float:
	return (1 + cos((1 - value) * twists * PI)) / 2
