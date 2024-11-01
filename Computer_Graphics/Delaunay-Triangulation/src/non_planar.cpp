// Project 3d to 2d

#include <point.hpp>
#include <file_reader.hpp>
#include <triangulate.hpp>

#include <iostream>
#include <map>
#include <cmath>

point_t project_point(const point3d_t &point) {
  double angle = acos(-1) / 6.0;
  double y_rot = point.x * sin(angle) + point.y * cos(angle);

  return point_t(-y_rot, point.z);
}

int main() {
  std::vector<point3d_t> points_3d = read_points3d("./sample/mcv/non_planar.in");
  std::map<point_t, point3d_t> point_map;
  std::vector<point_t> points;
  for (const auto& point : points_3d) {
    point_t projected_point = project_point(point);
    point_map[projected_point] = point;
    points.push_back(projected_point);
  }
  std::vector<triangle_t> mesh = bowyer_watson(points);
  std::cerr << "Number of triangles: " << mesh.size() << std::endl;
  std::vector<triangle3d_t> mesh_3d;
  for (auto& triangle : mesh) {
    mesh_3d.emplace_back(point_map[triangle.a], point_map[triangle.b], point_map[triangle.c]);
  }
  write_triangles3d(mesh_3d, "./sample/mcv/non_planar.out");
  for(auto &triangle: mesh_3d){
    std::cout << "(" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ") - (" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ")" << std::endl;
    std::cout << "(" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ") - (" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ")" << std::endl;
    std::cout << "(" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ") - (" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ")" << std::endl;
  }
  return 0;
}