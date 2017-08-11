sentence = input("Enter String: ")
sentence = sentence.split(' ')
Words = {}
new_sentence = []

for word in sentence:
	if (word.lower() not in Words):
		Words[word.lower()] = True
		new_sentence.append(word)


new_sentence = sorted(new_sentence, key = str.lower);
print(new_sentence)

		
		
		


