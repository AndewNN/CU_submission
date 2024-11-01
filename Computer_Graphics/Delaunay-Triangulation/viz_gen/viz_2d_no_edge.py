import matplotlib.pyplot as plt
import numpy as np
import sys

if len(sys.argv) != 2:
  print('Usage: python viz_2d_no_edge.py <path_to_2d_file>')
  sys.exit(1)

point_list = list()

with open(sys.argv[1], 'r') as f:
  for line in f:
    line = line.strip()
    if line:
      point_list.append([float(x) for x in line.split()])

points = np.array(point_list)

fig, ax = plt.subplots()

ax.scatter(points[:, 0], points[:, 1], color='b')

ax.set_xlabel('X')
ax.set_ylabel('Y')

plt.show()