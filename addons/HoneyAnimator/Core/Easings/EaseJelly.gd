extends EaseBase

export var amplitude := 1.0
export var frequency := 1.0


func jelly(value: float) -> float:
	return sin(value * 2 * PI * frequency) * pow(2, -10 * value) * sin((value - amplitude / 4) * (2 * PI) / amplitude + 1)


func ease_in(value: float) -> float:
	return jelly(value)


func ease_out(value: float) -> float:
	return 1- jelly(1- value)


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return jelly(value * 2) * 0.5
	else:
		return 0.5 + jelly((value - 0.5) * 2)


func ease_out_in(value: float) -> float:
	return ease_in_out(value)
