import matplotlib.pyplot as plt
import numpy as np
import sys

if len(sys.argv) != 2:
  print('Usage: python viz_2d.py <path_to_2d_file>')
  sys.exit(1)

point_list = list()
triangles_list = list()

with open(sys.argv[1], 'r') as f:
  for line in f:
    line = line.strip()
    if line:
      triangles_list.append([float(x) for x in line.split()])

triangles = np.array(triangles_list)

fig, ax = plt.subplots()

for triangle in triangles:
  vertices = np.array([triangle[0:2], triangle[2:4], triangle[4:6]])
  polygon = plt.Polygon(vertices, fill=None, edgecolor='black')
  ax.add_patch(polygon)

points = triangles.reshape(-1, 2)
ax.scatter(points[:, 0], points[:, 1], color='b')

ax.set_xlabel('X')
ax.set_ylabel('Y')

plt.show()