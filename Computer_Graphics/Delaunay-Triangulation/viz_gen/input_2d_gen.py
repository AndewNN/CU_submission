import random

n = 20

points = [(random.randint(0, 100), random.randint(0, 100)) for _ in range(n)]

with open('./sample/sample.2d.in', 'w') as f:
  for i in range(n):
    f.write(f'{points[i][0]} {points[i][1]}\n')
