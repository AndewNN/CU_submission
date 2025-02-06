// Simple OpenGL example for CS184 F06 by Nuttapong Chentanez, modified from sample code for CS184 on Sp06
// Modified for Realtime-CG class

/*
1. "-file" to write ppm image file instead of displaying it on the screen
2. "-toon [INT]" to apply toon shading with the given shade level
3. "-ellipsoid [FLOAT] [FLOAT] [FLOAT]" to draw ellipsoid with the given radii ratio
	let r = min(viewport.w, viewport.h)/2 - 10, then the ellipsoid radii are r*ellipsoid_xr, r*ellipsoid_yr, r*ellipsoid_zr
4. "-anisotropic_d" to apply anisotropic diffuse term but specular term is still isotropic (same)

ex. "-ka 0.2 0.3 0.3 -kd 1 1 0.5 -ks 0.6 0.6 0.6 -sp 30 -pl 5 5 5 0.3 0.3 0.3 -pl -5 -2 5 0.5 0.5 1 -dl 0 1 0 0.5 0.3 0.2 -ellipsoid 1.0 0.7 0.5 -anisotropic_d -toon 7 -file"
*/

#include <vector>
#include <iostream>
#include <fstream>
#include <cmath>

#define _WIN32

#ifdef _WIN32
#	include <windows.h>
#else
#	include <sys/time.h>
#endif

#ifdef OSX
#include <GLUT/glut.h>
#include <OpenGL/glu.h>
#else
#include <GL/glut.h>
#include <GL/glu.h>
#endif

#include <time.h>
#include <math.h>
#include "algebra3.h"

#ifdef _WIN32
static DWORD lastTime;
#else
static struct timeval lastTime;
#endif

#define PI 3.14159265

#define STB_IMAGE_WRITE_IMPLEMENTATION
#include <GL/stb_image_write.h>

using namespace std;

//****************************************************
// Some Classes
//****************************************************

class Viewport;

class Viewport {
public:
	int w, h; // width and height
};

class Material{
public:
	vec3 ka; // Ambient color
	vec3 kd; // Diffuse color
	vec3 ks; // Specular color
	float sp; // Power coefficient of specular

	Material() : ka(0.0f), kd(0.0f), ks(0.0f), sp(0.0f) {
	}
};

class Light{
public:
	enum LIGHT_TYPE{POINT_LIGHT, DIRECTIONAL_LIGHT};

	vec3 posDir;  // Position (Point light) or Direction (Directional light)
	vec3 color;   // Color of the light
	LIGHT_TYPE type;

	Light() : posDir(0.0f), color(0.0f), type(POINT_LIGHT) {
	}
};

// Material and lights
Material material;
vector<Light> lights;

//****************************************************
// Global Variables
//****************************************************
Viewport	viewport;
int 		drawX = 0;
int 		drawY = 0;
bool 		is_toon = false, is_ellipsoid = false, is_aniso_diff = false;
int 		toon_level;
float 		ellipsoid_xr=1.0f, ellipsoid_yr=1.0f, ellipsoid_zr=1.0f;

void initScene(){
	glClearColor(0.0f, 0.0f, 0.0f, 0.0f); // Clear to black, fully transparent

	glViewport (0,0,viewport.w,viewport.h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0,viewport.w, 0, viewport.h);
}


//****************************************************
// reshape viewport if the window is resized
//****************************************************
void myReshape(int w, int h) {
	viewport.w = w;
	viewport.h = h;

	glViewport (0,0,viewport.w,viewport.h);
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	gluOrtho2D(0, viewport.w, 0, viewport.h);

	drawX = (int)(viewport.w*0.5f);
	drawY = (int)(viewport.h*0.5f);


}

void setPixel(int x, int y, GLfloat r, GLfloat g, GLfloat b) {
	glColor3f(r, g, b);
	glVertex2f(x+0.5, y+0.5);
}

vec3 computeShadedColor(vec3 pos, vec3 normal) {

	// TODO: Your shading code mostly go here
	vec3 color(0.0f, 0.0f, 0.0f);

	for(int i=0; i<lights.size(); i++) {
		Light light = lights[i];
		vec3 L;
		if (light.type == Light::POINT_LIGHT) {
			L = (light.posDir - pos).normalize();
		} else {
			L = light.posDir.normalize();
		}
		vec3 N = normal.normalize();
		vec3 R = (2.0f * N * (N * L) - L).normalize();
		vec3 V = vec3(0.0f, 0.0f, 1.0f);
		vec3 ambient, diffuse, specular;

		for(int j=0; j<3; j++) {
			ambient[j] = material.ka[j] * light.color[j];
			if (is_aniso_diff){
				float t1 = 28*material.kd[j] / (23*PI) * (1-material.ks[j]);
				float t2 = 1 - pow(1 - max(0.0f, N * V/2), 5);
				float t3 = 1 - pow(1 - max(0.0f, N * L/2), 5);
				diffuse[j] = t1 * t2 * t3;
				// printf("%f %f %f %f\n", t1, t2, t3, t4);
			}
			else
				diffuse[j] = material.kd[j] * light.color[j] * max(0.0f, N * L);
			specular[j] = material.ks[j] * light.color[j] * pow(max(0.0f, R * V), material.sp);
		}

		color += ambient + diffuse + specular;
	}
	for(int j=0; j<3; j++) {
		color[j] = max(min(color[j], 1.0f), 0.0f);
		if (is_toon){
			int t = color[j] * toon_level;
			color[j] = t/float(toon_level);
		}
	}

	return color;

}

//****************************************************
// function that does the actual drawing of stuff
//***************************************************
void myDisplay() {

	glClear(GL_COLOR_BUFFER_BIT);				// clear the color buffer

	glMatrixMode(GL_MODELVIEW);					// indicate we are specifying camera transformations
	glLoadIdentity();							// make sure transformation is "zero'd"


	int drawRadius = min(viewport.w, viewport.h)/2 - 10;  // Make it almost fit the entire window
	float idrawRadius = 1.0f / drawRadius;
	// Start drawing sphere
	glBegin(GL_POINTS);

	int drawRadiusX = drawRadius * ellipsoid_xr;
	int drawRadiusY = drawRadius * ellipsoid_yr;
	int drawRadiusZ = drawRadius * ellipsoid_zr;
	float idrawRadiusX = 1.0f / drawRadiusX;
	float idrawRadiusY = 1.0f / drawRadiusY;
	float idrawRadiusZ = 1.0f / drawRadiusZ;

	for (int i = -min(drawY, drawRadiusY); i <= min(drawY, drawRadiusY); i++) {
		int width = floor(sqrt((float)(drawRadiusX*drawRadiusX*(1-((float)i*i)/(drawRadiusY*drawRadiusY)))));
		for (int j = -min(drawX, width); j <= min(drawX, width); j++) {
			float x = j * idrawRadiusX;
			float y = i * idrawRadiusY;
			float Z = drawRadiusZ * sqrtf(1.0f - x*x - y*y);
			float z = Z * idrawRadiusZ;
			vec3 pos(idrawRadius * j, idrawRadius * i, idrawRadius * Z);
			vec3 normal(idrawRadius*j/ellipsoid_xr*ellipsoid_xr, idrawRadius*i/ellipsoid_yr*ellipsoid_yr, idrawRadius*Z/ellipsoid_zr*ellipsoid_zr);
			vec3 col = computeShadedColor(pos, normal);
			setPixel(drawX + j, drawY + i, col.r, col.g, col.b);
		}
	}

	glEnd();

	glFlush();
	glutSwapBuffers();					// swap buffers (we earlier set double buffer)
}


//****************************************************
// for updating the position of the circle
//****************************************************

void myFrameMove() {
	float dt;
	// Compute the time elapsed since the last time the scence is redrawn
#ifdef _WIN32
	DWORD currentTime = GetTickCount();
	dt = (float)(currentTime - lastTime)*0.001f;
#else
	timeval currentTime;
	gettimeofday(&currentTime, NULL);
	dt = (float)((currentTime.tv_sec - lastTime.tv_sec) + 1e-6*(currentTime.tv_usec - lastTime.tv_usec));
#endif

	// Store the time
	lastTime = currentTime;
	glutPostRedisplay();
}

bool write_file = false;
void parseArguments(int argc, char* argv[]) {
	int i = 1;
	while (i < argc) {
		if (strcmp(argv[i], "-ka") == 0) {
			// Ambient color
			material.ka.r = (float)atof(argv[i+1]);
			material.ka.g = (float)atof(argv[i+2]);
			material.ka.b = (float)atof(argv[i+3]);
			i+=4;
		} else
		if (strcmp(argv[i], "-kd") == 0) {
			// Diffuse color
			material.kd.r = (float)atof(argv[i+1]);
			material.kd.g = (float)atof(argv[i+2]);
			material.kd.b = (float)atof(argv[i+3]);
			i+=4;
		} else
		if (strcmp(argv[i], "-ks") == 0) {
			// Specular color
			material.ks.r = (float)atof(argv[i+1]);
			material.ks.g = (float)atof(argv[i+2]);
			material.ks.b = (float)atof(argv[i+3]);
			i+=4;
		} else
		if (strcmp(argv[i], "-sp") == 0) {
			// Specular power
			material.sp = (float)atof(argv[i+1]);
			i+=2;
		} else
		if ((strcmp(argv[i], "-pl") == 0) || (strcmp(argv[i], "-dl") == 0)){
			Light light;
			// Specular color
			light.posDir.x = (float)atof(argv[i+1]);
			light.posDir.y = (float)atof(argv[i+2]);
			light.posDir.z = (float)atof(argv[i+3]);
			light.color.r = (float)atof(argv[i+4]);
			light.color.g = (float)atof(argv[i+5]);
			light.color.b = (float)atof(argv[i+6]);
			if (strcmp(argv[i], "-pl") == 0) {
				// Point
				light.type = Light::POINT_LIGHT;
			} else {
				// Directional
				light.type = Light::DIRECTIONAL_LIGHT;
			}
			lights.push_back(light);
			i+=7;
		} else
		if (strcmp(argv[i], "-file") == 0){
			write_file = true;
			i+=1;
		}else
		if (strcmp(argv[i], "-toon") == 0){
			is_toon = true;
			toon_level = atoi(argv[i+1]);
			i+=2;
		} else
		if (strcmp(argv[i], "-ellipsoid") == 0){
			is_ellipsoid = true;
			ellipsoid_xr = (float)atof(argv[i+1]);
			ellipsoid_yr = (float)atof(argv[i+2]);
			ellipsoid_zr = (float)atof(argv[i+3]);
			i+=4;
		} else
		if (strcmp(argv[i], "-anisotropic_d") == 0){
			is_aniso_diff = true;
			i+=1;
		}
	}
}
//****************************************************
// the usual stuff, nothing exciting here
//****************************************************
int main(int argc, char *argv[]) {

	parseArguments(argc, argv);
  	// Initalize theviewport size
  	viewport.w = 400;
  	viewport.h = 400;

	if (write_file) {

		int drawRadius = min(viewport.w, viewport.h)/2 - 10;  // Make it almost fit the entire window
		float idrawRadius = 1.0f / drawRadius;
		// Start drawing sphere
		// vector<unsigned char> image(viewport.w*viewport.h*3);
		unsigned char image[viewport.w*viewport.h*3];
		for (int i = 0; i < viewport.w*viewport.h*3; i++) {
			image[i] = 0;
		}
		float mi = 100000.0f;
		float ma = -100000.0f;
		drawX = (int)(viewport.w*0.5f);
		drawY = (int)(viewport.h*0.5f);

		int drawRadiusX = drawRadius * ellipsoid_xr;
		int drawRadiusY = drawRadius * ellipsoid_yr;
		int drawRadiusZ = drawRadius * ellipsoid_zr;
		float idrawRadiusX = 1.0f / drawRadiusX;
		float idrawRadiusY = 1.0f / drawRadiusY;
		float idrawRadiusZ = 1.0f / drawRadiusZ;

		for (int i = -min(drawY, drawRadiusY); i <= min(drawY, drawRadiusY); i++) {
			int width = floor(sqrt((float)(drawRadiusX*drawRadiusX*(1-((float)i*i)/(drawRadiusY*drawRadiusY)))));
			for (int j = -min(drawX, width); j <= min(drawX, width); j++) {
				float x = j * idrawRadiusX;
				float y = i * idrawRadiusY;
				float Z = drawRadiusZ * sqrtf(1.0f - x*x - y*y);
				float z = Z * idrawRadiusZ;

				vec3 pos(idrawRadius * j, idrawRadius * i, idrawRadius * Z);
				vec3 normal(idrawRadius*j/ellipsoid_xr*ellipsoid_xr, idrawRadius*i/ellipsoid_yr*ellipsoid_yr, idrawRadius*Z/ellipsoid_zr*ellipsoid_zr);
				vec3 col = computeShadedColor(pos, normal);

				image[((viewport.h - 1 - drawY - i)*viewport.w + drawX + j)*3] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.r)));
				image[((viewport.h - 1 - drawY - i)*viewport.w + drawX + j)*3+1] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.g)));
				image[((viewport.h - 1 - drawY - i)*viewport.w + drawX + j)*3+2] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.b)));
			}
		}

		ofstream ppmFile("output.ppm");
		ppmFile << "P3\n" << viewport.w << " " << viewport.h << "\n255\n";
		for (int i = 0; i < viewport.h; i++) {
			for (int j = 0; j < viewport.w; j++) {
				ppmFile << (int)image[(i*viewport.w + j)*3] << " " << (int)image[(i*viewport.w + j)*3+1] << " " << (int)image[(i*viewport.w + j)*3+2] << " ";
			}
			ppmFile << "\n";
		}
		return 0;

	}




  	//This initializes glut
  	glutInit(&argc, argv);

  	//This tells glut to use a double-buffered window with red, green, and blue channels
  	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);


  	//The size and position of the window
  	glutInitWindowSize(viewport.w, viewport.h);
  	glutInitWindowPosition(0,0);
  	glutCreateWindow(argv[0]);

   	// Initialize timer variable
	#ifdef _WIN32
	lastTime = GetTickCount();
	#else
	gettimeofday(&lastTime, NULL);
	#endif

  	initScene();							// quick function to set up scene

  	glutDisplayFunc(myDisplay);					// function to run when its time to draw something
  	glutReshapeFunc(myReshape);					// function to run when the window gets resized
  	glutIdleFunc(myFrameMove);

  	glutMainLoop();							// infinite loop that will keep drawing and resizing and whatever else

  	return 0;
}








