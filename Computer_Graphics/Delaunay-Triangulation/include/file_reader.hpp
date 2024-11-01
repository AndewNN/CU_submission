#ifndef __FILE_READER_HPP__
#define __FILE_READER_HPP__

#include <fstream>
#include <point.hpp>
#include <vector>
#include <string>

std::vector<point_t> read_points(const std::string& filename) {
  std::vector<point_t> points;
  std::ifstream file(filename);
  if (!file.is_open()) {
    throw std::runtime_error("Could not open file " + filename);
  }
  double x, y;
  while (file >> x >> y) {
    points.emplace_back(x, y);
  }
  return points;
}

std::vector<point3d_t> read_points3d(const std::string& filename) {
  std::vector<point3d_t> points;
  std::ifstream file(filename);
  if (!file.is_open()) {
    throw std::runtime_error("Could not open file " + filename);
  }
  double x, y, z;
  while (file >> x >> y >> z) {
    points.emplace_back(x, y, z);
  }
  return points;
}

void write_triangles(const std::vector<triangle_t>& triangles, const std::string& filename) {
  std::ofstream file(filename);
  if (!file.is_open()) {
    throw std::runtime_error("Could not open file " + filename);
  }
  for (const auto& triangle : triangles) {
    file << triangle.a.x << " " << triangle.a.y << " ";
    file << triangle.b.x << " " << triangle.b.y << " ";
    file << triangle.c.x << " " << triangle.c.y << " ";
    file << std::endl;
  }
}

void write_triangles3d(const std::vector<triangle3d_t>& triangles, const std::string& filename) {
  std::ofstream file(filename);
  if (!file.is_open()) {
    throw std::runtime_error("Could not open file " + filename);
  }
  for (const auto& triangle : triangles) {
    file << triangle.a.x << " " << triangle.a.y << " " << triangle.a.z << " ";
    file << triangle.b.x << " " << triangle.b.y << " " << triangle.b.z << " ";
    file << triangle.c.x << " " << triangle.c.y << " " << triangle.c.z << " ";
    file << std::endl;
  }
}



#endif