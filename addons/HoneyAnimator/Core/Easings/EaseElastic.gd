extends EaseBase

const C4 := (2 * PI) / 3
const C5 := (2 * PI) / 4


func ease_in(value: float) -> float:
	if value == 0:
		return 0.0
	elif value == 1:
		return  1.0
	else:
		return -pow(2, 10 * value - 10) * sin((value * 10 - 10.75) * C4)


func ease_out(value: float) -> float:
	if value == 0:
		return 0.0
	elif value == 1:
		return  1.0
	else:
		return pow(2, -10 * value) * sin((value * 10 - 0.75) * C4) + 1


func ease_in_out(value: float) -> float:
	if value == 0:
		return 0.0
	elif value == 1:
		return 1.0
	elif value < 0.5:
		return -pow(2, 20 * value - 10) * sin((20 * value - 11.125)) / 2
	else:
		return -pow(2, -20 * value + 10) * sin((20 * value - 11.125)) / 2 + 1


func ease_out_in(value: float) -> float:
	if value == 0:
		return 0.0
	elif value == 1:
		return 1.0
	elif value < 0.5:
		return -pow(2, -20 * value + 10) * sin((20 * value - 11.125)) / 2 + 1
	else:
		return -pow(2, 20 * value - 10) * sin((20 * value - 11.125)) / 2
