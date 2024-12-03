import fileinput

lines = fileinput.input()

left, right = zip(*map(lambda ln: ln[:-1].split('  '), lines))

left = sorted(map(int, left))
right = sorted(map(int, right))

difference = [abs(l-r) for l, r in zip(left, right)]

result = sum(difference)

print(result)

