import Foundation


struct ReadWordList {
	var phrases: [Phrase] = []

	init(word_list_path: String) {
		// read in the word list, storing the array of phrase
		// at phrases.
		let url = URL(fileURLWithPath: word_list_path)

		// note reads in entire file into memory and spilts the lines
		do {
			let data = try String(contentsOf: url, encoding: .utf8) 
			let lines = data.components(separatedBy: .newlines)
			var index = 0

			while index < lines.count {
				let english_text = lines[index].trimmingCharacters(in: .whitespaces)
				if english_text != "" {
					/** should be two full text lines together, first should
					be english, the next german. First line with text is
					presumed to be english. Second line is presumed to be
					german. If it's empty, it doesn't matter.
					Note, if german line is empty, rather than setting it
					on Phrase as '', set it as nil. **/
					var german_text: String? = lines[index + 1].trimmingCharacters(in: .whitespaces)
					if german_text == "" {
						german_text = nil
					}
					phrases.append(Phrase(english_text: english_text, german_text: german_text))
					// read in two lines, index +2
					index += 2
				}
				else {
					// read in only one line, index +1
					index += 1
				}
			}
		} catch {
			print(error)
		}
	}
}
