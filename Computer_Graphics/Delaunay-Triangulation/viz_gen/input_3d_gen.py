import random

n = 10

points = [(random.randint(0, 50), random.randint(0, 50), random.randint(0, 50)) for _ in range(n)]

with open('./sample/sample.3d.in', 'w') as f:
  for i in range(n):
    f.write(f'{points[i][0]} {points[i][1]} {points[i][2]}\n')
