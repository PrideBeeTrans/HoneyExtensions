extends EaseBase


func ease_in(value: float) -> float:
	return - cos(value * 2 * PI) * 0.5 + 0.5
	

func ease_out(value: float) -> float:
	return cos((value +1) * 2 * PI) * 0.5 + 0.5
	

func ease_in_out(value: float) -> float:
	return -cos(value * PI) * 0.5 + 0.5


func ease_out_in(value: float) -> float:
	return cos((value +1) * PI) * 0.5 + 0.5
