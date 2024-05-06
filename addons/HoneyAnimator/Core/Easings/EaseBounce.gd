extends EaseBase

const N1 := 7.5625
const D1 := 2.75


func ease_in(value: float) -> float:
	return 1- ease_out(1 - value)
	

func ease_out(value: float) -> float:
	if (value < 1 / D1):
		return N1 * value * value
	elif (value < 2 / D1):
		value -= 1.5 / D1
		return N1 * value * value + 0.75
	elif (value < 2.5 / D1):
		value -= 2.25 / D1
		return N1 * value * value + 0.9375
	else:
		value -= 2.625 / D1
		return N1 * value * value + 0.984375
	

func ease_in_out(value: float) -> float:
	if value < 0.5:
		return 0.5 * ease_in(2 * value)
	else:
		return 0.5 * ease_out(2 * value - 1) + 0.5
		

func ease_out_in(value: float) -> float:
	if value < 0.5:
		return 0.5 * ease_out(2 * value - 1) + 0.5
	else:
		return 0.5 * ease_in(2 * value)
