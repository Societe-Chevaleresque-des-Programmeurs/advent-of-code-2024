import fileinput
from collections import Counter

lines = fileinput.input()

left, right = zip(*map(lambda ln: ln[:-1].split('  '), lines))

left = list(map(int, left))
right = list(map(int, right))

count = Counter(right)

similarity_score = [num * count[num] for num in left]

print(sum(similarity_score))


