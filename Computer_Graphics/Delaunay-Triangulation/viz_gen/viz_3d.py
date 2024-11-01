import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
import sys

if len(sys.argv) != 2:
  print('Usage: python viz_3d.py <path_to_3d_file>')
  sys.exit(1)

triangle_list = []

with open(sys.argv[1], 'r') as file:
  for line in file:
    line = line.strip()
    if line:
      triangle_list.append([float(x) for x in line.split()])

triangles = np.array(triangle_list)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

for triangle in triangles:
    vertices = np.array([[triangle[0], triangle[1], triangle[2]],
                         [triangle[3], triangle[4], triangle[5]],
                         [triangle[6], triangle[7], triangle[8]]])
    faces = [[vertices[0], vertices[1], vertices[2]]]
    poly = Poly3DCollection(faces, edgecolor='black', facecolor='cyan', alpha=0.5)
    ax.add_collection3d(poly)

points = triangles.reshape(-1, 3)
ax.scatter(points[:, 0], points[:, 1], points[:, 2], color='b')

ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')

plt.show()