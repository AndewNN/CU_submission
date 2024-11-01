#include <point.hpp>
#include <file_reader.hpp>
#include <triangulate.hpp>

#include <iostream>

int main() {
  std::vector<point_t> points = read_points("./sample/sample.2d.in");
  std::vector<triangle_t> mesh = bowyer_watson(points);
  std::cerr << "Number of triangles: " << mesh.size() << std::endl;
  write_triangles(mesh, "./sample/sample.2d.out");
  return 0;
}