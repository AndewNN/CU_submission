# Delaunay Triangulation

This project uses the Bowyer-Watson algorithm to perform Delaunay triangulation on a set of points in 2D and 3D space. I tries to implement the algorithm in 3D space, but it ended up being too complex and I couldn't get it to work. So I just project the 3D points onto the $y = -x$ plane and perform the triangulation in 2D space.

## Triangulation

Run C++ file via makefile

```
./gen.sh
```

(I hope `src/gen_all.cpp` is the finished version)

## Visualization

### 2D

Points only

```
python viz_2d_no_edge.py <INPUT FILE>
```

Points and edges

```
python viz_2d <INPUT FILE>
```

### 3D

Points only

```
python viz_3d_no_edge.py <INPUT FILE>
```

Points and edges

```
python viz_3d <INPUT FILE>
```

## Sample Generator

### 2D

```
python sample_gen_2d.py
```

### 3D

```
python sample_gen_3d.py
```
