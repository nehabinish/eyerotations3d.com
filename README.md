# Three-dimensional-eye-rotations

This project simulates and analyzes three-dimensional rotations of the human eye in response to visual stimuli, taking into account **Listing’s Law** and **Donder’s Law**. The goal is to visualize and understand eye movement behavior through rotational vectors and the Listing's plane.

The simulation computes the eye’s initial and final positions after making rotations to follow a target stimulus presented on a screen.

---

## List of Files (src)

| File           | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `main.m`       | Execute all trials and simulations.                                         |
| `screen.m`     | Define the structure and properties of the screen/stimulus layout.          |
| `mesh.m`       | Create and display mesh points on the screen.                               |
| `rotation.m`   | Calculate rotation angles and vectors for eye movements.                    |
| `root2d.m`     | Solve system of equations to convert rotation vectors to Fick's angles.     |
| `visualangle.m`| Compute the visual angle for each executed eye rotation.                    |
| `eyesm.m`      | Simulate both initial and final eye positions during movement.              |
| `rotpt.m`      | Rotate an input point by x, y, z angles using Fick’s rotation sequence.     |

---

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/nehabinish/Three-dimensional-eye-rotations.git
   cd Three-dimensional-eye-rotations
   ```

2. Run `main.m` in MATLAB to start the simulation.

3. Review generated outputs for rotation vectors, visual angles, and eye position plots.

---

## Further Documentation

Explore detailed explanations, diagrams, and motivation at:
[https://nehabinish.github.io/eyerotations3d.com](https://nehabinish.github.io/eyerotations3d.com)
