#ifndef __TRIANGULATE_HPP__
#define __TRIANGULATE_HPP__

#include <point.hpp>

#include <vector>
#include <numeric>
#include <algorithm>
#include <complex>
#include <cstdbool>

double distance(const point_t& p1, const point_t& p2) {
  return std::sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y));
}

bool circumcircle_contains(const triangle_t& tri, const point_t& p) {
  double ax = tri.a.x, ay = tri.a.y;
  double bx = tri.b.x, by = tri.b.y;
  double cx = tri.c.x, cy = tri.c.y;
  double dx = p.x, dy = p.y;

  double A = ax - dx;
  double B = ay - dy;
  double C = (ax * ax - dx * dx) + (ay * ay - dy * dy);
  double D = bx - dx;
  double E = by - dy;
  double F = (bx * bx - dx * dx) + (by * by - dy * dy);
  double G = cx - dx;
  double H = cy - dy;
  double I = (cx * cx - dx * dx) + (cy * cy - dy * dy);

  double det = A * (E * I - F * H) - B * (D * I - F * G) + C * (D * H - E * G);
  return det > 0;
}

std::vector<triangle_t> bowyer_watson(std::vector<point_t> points) {
  std::vector<triangle_t> mesh;
  double min_x = points[0].x, min_y = points[0].y, max_x = points[0].x, max_y = points[0].y;
  for (const auto& point : points) {
    min_x = std::min(min_x, point.x);
    min_y = std::min(min_y, point.y);
    max_x = std::max(max_x, point.x);
    max_y = std::max(max_y, point.y);
  }
  double delta = std::max(max_x - min_x, max_y - min_y);
  point_t p1(min_x - delta, min_y - delta);
  point_t p2(max_x + delta, min_y - delta);
  point_t p3((min_x + max_x) / 2, max_y + delta);
  mesh.emplace_back(p1, p2, p3);

  for(const auto& point: points) {
    std::vector<triangle_t> bad_triangles;
    for (const auto& triangle: mesh) {
      if (circumcircle_contains(triangle, point)) {
          bad_triangles.push_back(triangle);
      }
    }
    std::vector<edge_t> polygon;
    for (const auto& tri: bad_triangles) {
      edge_t edges[3] = {
        {tri.a, tri.b}, {tri.b, tri.c}, {tri.c, tri.a}
      };
      for(const auto& edge: edges) {
        bool shared = false;
        for(const auto& other_tri: bad_triangles) {
          if(tri == other_tri) continue;
          edge_t other_edges[3] = {
            {other_tri.a, other_tri.b}, 
            {other_tri.b, other_tri.c}, 
            {other_tri.c, other_tri.a}
          };
          for(const auto& other_edge: other_edges) {
            if((edge.first == other_edge.first && edge.second == other_edge.second) ||
                (edge.first == other_edge.second && edge.second == other_edge.first)) {
                shared = true;
                break;
            }
          }
          if (shared) break;
        }
        if (!shared) {
          polygon.push_back(edge);
        }
      }
    }
    for(const auto& triangle: bad_triangles) {
      mesh.erase(std::remove(mesh.begin(), mesh.end(), triangle), mesh.end());
    }
    for(const auto& edge: polygon) {
      mesh.emplace_back(edge.first, edge.second, point);
    }
  }
  mesh.erase(std::remove_if(mesh.begin(), mesh.end(), [&](const triangle_t& tri) {
    return tri.contains_vertex(p1) || tri.contains_vertex(p2) || tri.contains_vertex(p3);
  }), mesh.end());

  return mesh;
}

#endif 