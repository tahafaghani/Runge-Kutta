# Dynamics Simulations with Runge-Kutta Numerical Method

## Author: Taha Faghani

This repository contains simulations of dynamic systems using the **Runge-Kutta numerical method** to solve the system of differential equations governing the dynamics of various mechanical systems. These codes simulate multi-degree-of-freedom systems and vectorial dynamics.

## Project Structure

### MATLAB Codes:
- **`3DOF_Rung_kuttah.m`**: Simulates a three-degree-of-freedom system using the 4th-order Runge-Kutta method. This system involves complex interactions between the degrees of freedom, which are solved numerically.
- **`vectorial_dynamics_R4.m`**: Simulates a two-body system using vectorial dynamics and the Runge-Kutta method to account for gravitational forces between two masses.

## Dynamics and the Runge-Kutta Method

### Dynamics
The term **dynamics** refers to the study of forces and motion on physical systems. In these simulations, the equations of motion are derived from Newton's laws, which describe how the positions, velocities, and accelerations of the system evolve over time.

### Runge-Kutta Numerical Method
The **Runge-Kutta method** is a popular technique used for solving ordinary differential equations (ODEs), particularly when they cannot be solved analytically. The 4th-order Runge-Kutta method is widely used because of its balance between accuracy and computational cost.

In the context of these simulations:
- The equations of motion are discretized into small time steps.
- At each time step, intermediate values (k1, k2, k3, k4) are calculated to approximate the solution for the next time step.
- This method allows for accurate tracking of the positions and velocities of objects in dynamic systems.

## Code Descriptions

### 3DOF System (`3DOF_Rung_kuttah.m`)
This code simulates a system with three degrees of freedom (DOF). The system involves two rotating bodies connected to a sliding cart. The equations of motion are solved using the 4th-order Runge-Kutta method.

#### Key Features:
- Simulates the motion of the system over time.
- Plots the positions of the rotating bodies and the sliding cart.

### Vectorial Dynamics of Two Bodies (`vectorial_dynamics_R4.m`)
This script simulates a two-body problem where two masses interact under gravitational forces. The 4th-order Runge-Kutta method is used to numerically integrate the equations of motion, calculating the positions and velocities of the two bodies over time.

#### Key Features:
- Simulates the interaction between two masses in a gravitational field.
- Plots the trajectories of the two bodies.

## Visualization
Both scripts produce plots that show the motion of the system over time:

3DOF_Rung_kuttah.m: Plots the motion of the rotating bodies and sliding cart.
vectorial_dynamics_R4.m: Plots the trajectories of the two masses under the influence of gravity.

## Conclusion

These simulations are designed to provide insights into solving dynamic systems using the Runge-Kutta numerical method. They are ideal for students and researchers working in mechanical engineering and physics who want to explore multi-degree-of-freedom systems and vectorial dynamics.

## How to Run the Codes

1. Open MATLAB.
2. Navigate to the directory where the scripts are stored.
3. Run the scripts in MATLAB by typing:

```matlab
3DOF_Rung_kuttah
vectorial_dynamics_R4


