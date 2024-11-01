#ifndef __POINT_HPP__
#define __POINT_HPP__

#include <tuple>
#include <vector>

struct point_t {
  double x, y;

  point_t(double x, double y) : x(x), y(y) {}
  point_t() : x(0), y(0) {}

  bool operator == (const point_t& other) const {
    return x == other.x && y == other.y;
  }

  bool operator != (const point_t& other) const {
    return x != other.x || y != other.y;
  }

  bool operator < (const point_t& other) const {
    return std::tie(x, y) < std::tie(other.x, other.y);
  }
};

struct point3d_t {
  double x, y, z;

  point3d_t(double x, double y, double z) : x(x), y(y), z(z) {}
  point3d_t() : x(0), y(0), z(0) {}

  bool operator == (const point3d_t& other) const {
    return x == other.x && y == other.y && z == other.z;
  }

  bool operator != (const point3d_t& other) const {
    return x != other.x || y != other.y || z != other.z;
  }

  bool operator < (const point3d_t& other) const {
    return std::tie(x, y, z) < std::tie(other.x, other.y, other.z);
  }

  bool operator > (const point3d_t& other) const {
    return std::tie(x, y, z) > std::tie(other.x, other.y, other.z);
  }
};

struct triangle_t {
  point_t a, b, c;

  triangle_t(point_t a, point_t b, point_t c) : a(a), b(b), c(c) {}
  triangle_t() : a(), b(), c() {}

  bool operator == (const triangle_t& other) const {
    return a == other.a && b == other.b && c == other.c;
  }

  bool operator != (const triangle_t& other) const {
    return a != other.a || b != other.b || c != other.c;
  }

  bool contains_vertex(const point_t& p) const {
    return a == p || b == p || c == p;
  }
};

struct triangle3d_t {
  point3d_t a, b, c;

  triangle3d_t(point3d_t a, point3d_t b, point3d_t c) : a(a), b(b), c(c) {}
  triangle3d_t() : a(), b(), c() {}

  bool operator == (const triangle3d_t& other) const {
    return a == other.a && b == other.b && c == other.c;
  }

  bool operator != (const triangle3d_t& other) const {
    return a != other.a || b != other.b || c != other.c;
  }

  bool contains_vertex(const point3d_t& p) const {
    return a == p || b == p || c == p;
  }
};

using edge_t = std::pair<point_t, point_t>;

#endif