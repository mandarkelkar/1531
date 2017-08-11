index = int(input("Enter num "))

def fib(index):
	nums = [1,1]
	if (index < 2):
		return 1
	for i in range(2,index):
		nums.append(nums[i-1] + nums[i-2])
	return nums[index-1]


print(fib(index))
