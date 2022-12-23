#include "test.h"

#include <iostream>

#include "GLFW/glfw3.h"

namespace apgl
{
	void testLog()
	{
		std::cout << "Hello OpenGL Sandbox!" << std::endl;
	}

	void window()
	{
		GLFWwindow* window;
		if (!glfwInit())
		{
			fprintf(stderr, "Failed to initialize GLFW\n");
			exit(EXIT_FAILURE);
		}
		window = glfwCreateWindow(300, 200, "OpenGL Sandbox", NULL, NULL);
		if (!window)
		{
			fprintf(stderr, "Failed to open GLFW window\n");
			glfwTerminate();
			exit(EXIT_FAILURE);
		}

		// main loop
		while (!glfwWindowShouldClose(window))
		{
			// swap buffers
			glfwSwapBuffers(window);
			glfwPollEvents();
		}

		// terminate GLFW
		glfwTerminate();
	}
}