left = []
right = []
L = []
with open("input.txt", 'r') as f:
	L = f.readlines()

for i in L:
	left_n = i.split("   ")[0]
	right_n = i.split("   ")[1].replace("\n", "")

	left.append(int(left_n))
	right.append(int(right_n))

left.sort()
right.sort()

similarity = 0
distance = 0

for i in range(len(left)):
	count = 0
	t = left[i] - right[i]
	if t < 0:
		distance -= t
	else:
		distance += t

	k = right[:]
	for j in range(len(k)):
		if left[i] == k[j]:
			count += 1
	similarity += left[i] * count

print("distance : ", distance)
print("similarity : ", similarity)