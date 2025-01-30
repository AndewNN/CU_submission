// Simple OpenGL example for CS184 F06 by Nuttapong Chentanez, modified from sample code for CS184 on Sp06
// Modified for Realtime-CG class

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
bool 		is_toon = false;
int 		toon_level;

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

vec3 computeShadedColor(vec3 pos) {

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
		vec3 N = pos;
		vec3 R = (2.0f * N * (N * L) - L).normalize();
		vec3 V = vec3(0.0f, 0.0f, 1.0f);
		vec3 ambient, diffuse, specular;

		for(int j=0; j<3; j++) {
			ambient[j] = material.ka[j] * light.color[j];
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

	for (int i = -drawRadius; i <= drawRadius; i++) {
		int width = floor(sqrt((float)(drawRadius*drawRadius-i*i)));
		for (int j = -width; j <= width; j++) {

			// Calculate the x, y, z of the surface of the sphere
			float x = j * idrawRadius;
			float y = i * idrawRadius;
			float z = sqrtf(1.0f - x*x - y*y);
			vec3 pos(x,y,z); // Position on the surface of the sphere

			vec3 col = computeShadedColor(pos);

			// Set the red pixel
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
		for (int i = -drawRadius; i <= drawRadius; i++) {
			int width = floor(sqrt((float)(drawRadius*drawRadius-i*i)));
			for (int j = -width; j <= width; j++) {

				// Calculate the x, y, z of the surface of the sphere
				float x = j * idrawRadius;
				float y = i * idrawRadius;
				float z = sqrtf(1.0f - x*x - y*y);
				vec3 pos(x,y,z); // Position on the surface of the sphere

				vec3 col = computeShadedColor(pos);

				// printf("%d %d %d\n", (int)(col.r*255), (int)(col.g*255), (int)(col.b*255));
				mi = min(mi, min(col.r, min(col.g, col.b)));
				ma = max(ma, max(col.r, max(col.g, col.b)));
				// image[((drawY + i)*viewport.w + drawX + j)*3] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.r)));
				// image[((drawY + i)*viewport.w + drawX + j)*3+1] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.g)));
				// image[((drawY + i)*viewport.w + drawX + j)*3+2] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.b)));

				image[((viewport.h - 1 - drawY - i)*viewport.w + drawX + j)*3] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.r)));
				image[((viewport.h - 1 - drawY - i)*viewport.w + drawX + j)*3+1] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.g)));
				image[((viewport.h - 1 - drawY - i)*viewport.w + drawX + j)*3+2] = (unsigned char)(255.99f*min(1.0f, max(0.0f, col.b)));
				// printf("(%d %d) ",drawX + j, drawY + i);
			}
		}
		// flip image
		stbi_write_jpg("./output.jpg", viewport.w, viewport.h, 3, &image[0], 100);
		// printf("mi: %d ma: %d\n", mi, ma);
		// printf("%f %f\n", mi, ma);
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








