extends EaseBase

const C1 := 1.70158
const C2 := C1 * 1.525
const C3 := C1 + 1


func ease_in(value: float) -> float:
	return C3 * value * value * value - C1 * value * value


func ease_out(value: float) -> float:
	return 1 + C3 * pow(value - 1, 3) + C1 * pow(value - 1, 2)


func ease_in_out(value: float) -> float:
	if value < 0.5:
		return (pow(2 * value, 2) * ((C2 + 1) * 2 * value - C2)) / 2
	else:
		return (pow(2 * value - 2, 2) * ((C2 + 1) * (value * 2 - 2) + C2) + 2) / 2


func ease_out_in(value: float) -> float:
	if value < 0.5:
		return (pow(2 * value - 2, 2) * ((C2 + 1) * (value * 2 - 2) + C2) + 2) / 2
	else:
		return (pow(2 * value, 2) * ((C2 + 1) * 2 * value - C2)) / 2
