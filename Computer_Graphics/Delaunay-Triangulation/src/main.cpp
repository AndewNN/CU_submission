// Project 3d to 2d

#include <cmath>
#include <file_reader.hpp>
#include <iostream>
#include <map>
#include <point.hpp>
#include <set>
#include <triangulate.hpp>

point_t project_point(const point3d_t& point) {
    double angle = acos(-1) / 6.0;
    double y_rot = point.x * sin(angle) + point.y * cos(angle);

    return point_t(-y_rot, point.z);
}

bool point_collinear(std::set<point3d_t> points) {
    if (points.size() < 3) {
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
    for (; it != points.end(); it++) {
        double x3 = it->x;
        double y3 = it->y;
        double z3 = it->z;
        if ((x2 - x1) * (y3 - y1) - (y2 - y1) * (x3 - x1) != 0) {
            return false;
        }
    }
    return true;
}

int main(int argc, char* argv[]) {
    std::string inFile = std::string(argv[1]);
    std::string outFile = std::string(argv[2]);

    std::vector<point3d_t> points_3d = read_points3d(inFile);
    std::map<point_t, point3d_t> point_map;
    std::vector<point_t> points;
    std::set<double> xs, ys, zs;
    for (const auto& point : points_3d) {
        xs.insert(point.x);
        ys.insert(point.y);
        zs.insert(point.z);
        point_t projected_point = project_point(point);
        point_map[projected_point] = point;
        points.push_back(projected_point);
    }
    if (xs.size() == 1) {
        for (int i = 0; i < points.size(); i++) {
            points[i] = point_t(points_3d[i].y, points_3d[i].z);
            point_map[points[i]] = points_3d[i];
        }
    } else if (ys.size() == 1) {
        for (int i = 0; i < points.size(); i++) {
            points[i] = point_t(points_3d[i].x, points_3d[i].z);
            point_map[points[i]] = points_3d[i];
        }
    } else if (zs.size() == 1) {
        for (int i = 0; i < points.size(); i++) {
            points[i] = point_t(points_3d[i].x, points_3d[i].y);
            point_map[points[i]] = points_3d[i];
        }
    }
    std::cerr << "Number of points: " << points.size() << std::endl;
    std::set<point_t> point_set(points.begin(), points.end());
    std::cerr << "Number of unique points: " << point_set.size() << std::endl;
    std::vector<triangle_t> mesh = bowyer_watson(points);
    std::cerr << "Number of triangles: " << mesh.size() << std::endl;
    std::vector<triangle3d_t> mesh_3d;
    for (auto& triangle : mesh) {
        mesh_3d.emplace_back(point_map[triangle.a], point_map[triangle.b], point_map[triangle.c]);
    }

    std::set<point3d_t> points_set(points_3d.begin(), points_3d.end());
    if (point_collinear(points_set)) {
        std::cerr << "Points are collinear" << std::endl;
        std::cout << "(" << points_set.begin()->x << ", " << points_set.begin()->y << ", " << points_set.begin()->z << ") - (" << points_set.rbegin()->x << ", " << points_set.rbegin()->y << ", " << points_set.rbegin()->z << ")" << std::endl;

        std::ofstream file(outFile);
        if (!file.is_open()) {
            throw std::runtime_error("Could not open file " + outFile);
        }
        file << "(" << points_set.begin()->x << ", " << points_set.begin()->y << ", " << points_set.begin()->z << ") - (" << points_set.rbegin()->x << ", " << points_set.rbegin()->y << ", " << points_set.rbegin()->z << ")" << std::endl;
        return 0;
    }

    write_triangles3d(mesh_3d, outFile);
    for (auto& triangle : mesh_3d) {
        std::cout << "(" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ") - (" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ")" << std::endl;
        std::cout << "(" << triangle.b.x << ", " << triangle.b.y << ", " << triangle.b.z << ") - (" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ")" << std::endl;
        std::cout << "(" << triangle.c.x << ", " << triangle.c.y << ", " << triangle.c.z << ") - (" << triangle.a.x << ", " << triangle.a.y << ", " << triangle.a.z << ")" << std::endl;
    }
    return 0;
}