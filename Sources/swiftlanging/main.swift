
if CommandLine.arguments.count != 2 {
	print("Usage: swiftlanging word_list_path")
}
else {
	let word_path = CommandLine.arguments[1]
	let read_word_list = ReadWordList(word_list_path: word_path)
	print(read_word_list.phrases)
}
