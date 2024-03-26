class_name StringUtils
extends Reference


static func is_palindrome(string: String) -> bool:
	return string == reverse_string(string)


static func character_list_to_string(character_list: Array) -> String:
	var string := ""
	for character in character_list:
		string += character
	return string


static func count_character_occurrences(text: String,character: String) -> int:
	var count := 0
	for t in text:
		if t == character:
			count += 1
	return count


static func reverse_string(string: String) -> String:
	var reversed_str := ""
	for i in range(string.length() -1, -1, -1):
		reversed_str += string[i]
	return reversed_str


static func shuffle_string(string: String) -> String:
	var character_list := Array(string.to_ascii())
	character_list.shuffle()
	return character_list_to_string(character_list)
