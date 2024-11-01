// Project 3d to 2d

#include <point.hpp>
#include <file_reader.hpp>
#include <triangulate.hpp>

#include <iostream>
#include <map>
#include <set>

bool point_collinear(std::set<point3d_t> points){
  if(points.size() < 3){
    return true;
  }
  auto it = points.begin();
  double x1 = it->x;
  double y1 = it->y;
  double z1 = it->z;
  it++;
  double x2 = it->x;
  double y2 = it->y;
  double z2 = it->z;
  it++;
  for(; it != points.end(); it++){
    double x3 = it->x;
    double y3 = it->y;
    double z3 = it->z;
    if((x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1) != 0){
      return false;
    }
  }
  return true;
}

int main(int argc, char* argv[]) {
  std::vector<point3d_t> points_3d = read_points3d("./sample/mcv/degen.in");
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
  write_triangles3d(mesh_3d, "./sample/mcv/degen.out");
  for(auto &triangle: mesh_3d){
    std::cout << "(" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ") - (" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ")" << std::endl;
    std::cout << "(" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ") - (" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ")" << std::endl;
    std::cout << "(" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ") - (" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ")" << std::endl;
  }
  std::set<point3d_t> points_set(points_3d.begin(), points_3d.end());
  if(point_collinear(points_set)){
    std::cerr << "Points are collinear" << std::endl;
    std::cout << "(" << points_set.begin()->x << ", " << points_set.begin()->y << ", " << points_set.begin()->z << ") - (" << points_set.rbegin()->x << ", " << points_set.rbegin()->y << ", " << points_set.rbegin()->z << ")" << std::endl;
    
    std::string fileName = "./sample/mcv/degen.out";
    std::ofstream file(fileName);
    if (!file.is_open()) {
      throw std::runtime_error("Could not open file " + fileName);
    }
    file << "(" << points_set.begin()->x << ", " << points_set.begin()->y << ", " << points_set.begin()->z << ") - (" << points_set.rbegin()->x << ", " << points_set.rbegin()->y << ", " << points_set.rbegin()->z << ")" << std::endl;
  }

  return 0;
}