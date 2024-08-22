# Swift Numerical Methods

This is a Swift library implementing various numerical methods for root finding, optimization, regression, interpolation, linear algebra, numerical integration, and solving ordinary and partial differential equations, with the goal of creating reusable and modular code that prioritizes efficiency, maintainability, and robust error handling while providing an intuitive interface for end-users.

## Methods Implemented

The library is organized into different modules, each containing the implementation of a specific category of numerical methods:

- **Root Finding** (`RootFinding`): Contains methods for finding the roots of a function.
  - Bisection (`Bisection.swift`)
  - Newton-Raphson (`NewtonRaphson.swift`)

- **Optimization** (`Optimization`): Contains methods for optimizing a function.
  - Gradient Descent (`GradientDescent.swift`)

- **Regression** (`Regression`): Contains methods for performing regression analysis.
  - Least Squares (`LeastSquares.swift`)

- **Interpolation** (`Interpolation`): Contains methods for interpolating data points.
  - Lagrange Interpolation (`LagrangeInterpolation.swift`)

- **Numerical Integration** (`NumericalIntegration`): Contains methods for numerical integration.
  - Trapezoidal Rule (`TrapezoidalRule.swift`)
  - Simpson's Rule (`SimpsonsRule.swift`)

- **ODE Solutions** (`ODESolutions`): Contains methods for solving ordinary differential equations.
  - Euler's Method (`EulerMethod.swift`)
  - Runge-Kutta Methods (`RungeKuttaMethods.swift`)

- **PDE Solutions** (`PDESolutions`): Contains methods for solving partial differential equations.
  - Finite Difference Method (`FiniteDifferenceMethod.swift`)

Each module contains a `.swift` file with the implementation of the methods.

In addition to these modules, the `Tests` directory contains test files for each method, and `main.swift` is the entry point for the application.

## Library Structure
```
NumericalMethodsSwift/
|-- RootFinding/
  | |-- Bisection.swift
  | |-- NewtonRaphson.swift
|-- Optimization/
  | |-- GradientDescent.swift
|-- Regression/
  | |-- LeastSquares.swift
|-- Interpolation/
  | |-- LagrangeInterpolation.swift
|-- NumericalIntegration/
  | |-- TrapezoidalRule.swift
  | |-- SimpsonsRule.swift
|-- ODESolutions/
  | |-- EulerMethod.swift
  | |-- RungeKuttaMethods.swift
|-- PDESolutions/
  | |-- FiniteDifferenceMethod.swift
|-- Tests/
  | |-- TestBisection.swift
  | |-- TestNewtonRaphson.swift
  | |-- TestGradientDescent.swift
  | |-- TestLeastSquares.swift
|-- main.swift

```
