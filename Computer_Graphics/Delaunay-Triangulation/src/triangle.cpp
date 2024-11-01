// Project 3d to 2d

#include <point.hpp>
#include <file_reader.hpp>
#include <triangulate.hpp>

#include <iostream>
#include <map>

int main() {
  std::vector<point3d_t> points_3d = read_points3d("./sample/mcv/triangle.in");
  std::map<point_t, point3d_t> point_map;
  std::vector<point_t> points;
  for (const auto& point : points_3d) {
    point_map[point_t(point.x, point.y)] = point;
    points.push_back(point_t(point.x, point.y));
  }
  std::vector<triangle_t> mesh = bowyer_watson(points);
  std::cerr << "Number of triangles: " << mesh.size() << std::endl;
  std::vector<triangle3d_t> mesh_3d;
  for (auto& triangle : mesh) {
    mesh_3d.emplace_back(point_map[triangle.a], point_map[triangle.b], point_map[triangle.c]);
  }
  write_triangles3d(mesh_3d, "./sample/mcv/triangle.out");
  for(auto &triangle: mesh_3d){
    std::cout << "(" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ") - (" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ")" << std::endl;
    std::cout << "(" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ") - (" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ")" << std::endl;
    std::cout << "(" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ") - (" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ")" << std::endl;
  }
  return 0;
}