extends EaseBase


func ease_in(value: float) -> float:
	return value * value * value * (value * (value * 6 - 10) + 10)


func ease_out(value: float) -> float:
	return 1- ease_in(1 - value)


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return ease_in(value * 2) / 2
	else:
		return ease_out(value * 2 -1) / 2 + 0.5


func ease_out_in(value: float) -> float:
	if value < 0.5:
		return ease_out(value * 2) / 2
	else:
		return ease_in(value * 2 -1) / 2 + 0.5
