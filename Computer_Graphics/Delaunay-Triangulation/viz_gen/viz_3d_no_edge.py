import matplotlib.pyplot as plt
import numpy as np
import sys

point_list = list()

if len(sys.argv) != 2:
  print('Usage: python viz_3d_no_edge.py <path_to_3d_file>')
  sys.exit(1)

with open(sys.argv[1], 'r') as f:
  for line in f:
    line = line.strip()
    if line:
      point_list.append([float(x) for x in line.split()])

points = np.array(point_list)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(points[:, 0], points[:, 1], points[:, 2], color='b')

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

plt.show()