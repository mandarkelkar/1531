import random
sentence = input("Input: ")
sentence = sentence.split(',')

def randomise(sentence):
	for i in range(1, 1001):
		rand1 = random.randint(0, len(sentence)-1)
		#print(rand1)
		rand2 = random.randint(0, len(sentence)-1)
		#print(rand2)
		sentence = swap(sentence, rand1, rand2)
	return sentence

def swap(sentence, num1, num2):
	temp = sentence[num1]
	sentence[num1] = sentence[num2]
	sentence[num2] = temp
	return sentence
	
print("Output:", randomise(sentence))
