extends EaseBase


func ease_in(value: float) -> float:
	return 1 - sin((1 - value) * PI / 2)
	

func ease_out(value: float) -> float:
	return sin(value * PI / 2)
	

func ease_in_out(value: float) -> float:
	return 0.5 * (1 - cos(value * PI))


func ease_out_in(value: float) -> float:
	return 1 - 0.5 * (1- sin((1 - value) * PI))
