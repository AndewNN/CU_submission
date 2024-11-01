import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import sys

if len(sys.argv) != 2:
  print('Usage: python mcv.py <input_file>')
  sys.exit(1)

edges = []
point_set = set()

with open(sys.argv[1], 'r') as file:
  for line in file:
    line = line.strip()
    if line:
      points = line.split(' - ')
      point1 = tuple(map(float, points[0].strip('()').split(',')))
      point2 = tuple(map(float, points[1].strip('()').split(',')))
      point_set.add(point1)
      point_set.add(point2)
      edges.append((point1, point2))

points = np.array(list(point_set))

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

for edge in edges:
  edge_points = np.array(edge)
  ax.plot(edge_points[:, 0], edge_points[:, 1], edge_points[:, 2], color='black')

ax.scatter(points[:, 0], points[:, 1], points[:, 2], color='b')

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

plt.show()