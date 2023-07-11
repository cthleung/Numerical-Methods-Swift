# Numerical Methods Library in C++

This is a C++ library implementing various numerical methods for root finding, optimization, regression, interpolation, numerical integration, and solving ordinary and partial differential equations.

## Methods Implemented

The library is organized into different modules, each containing the implementation of a specific category of numerical methods:

- **Root Finding** (`root_finding/`): Contains methods for finding the roots of a function.
  - Bisection (`bisection.cpp`, `bisection.h`)
  - Newton-Raphson (`newton_raphson.cpp`, `newton_raphson.h`)

- **Optimization** (`optimization/`): Contains methods for optimizing a function.
  - Gradient Descent (`gradient_descent.cpp`, `gradient_descent.h`)

- **Regression** (`regression/`): Contains methods for performing regression analysis.
  - Least Squares (`least_squares.cpp`, `least_squares.h`)

- **Interpolation**: Contains methods for interpolating data points.
  - Lagrange Interpolation (`lagrange_interpolation.cpp`, `lagrange_interpolation.h`)

- **Numerical Integration**: Contains methods for numerical integration.
  - Trapezoidal Rule (`trapezoidal_rule.cpp`, `trapezoidal_rule.h`)
  - Simpson's Rule (`simpsons_rule.cpp`, `simpsons_rule.h`)

- **ODE Solutions**: Contains methods for solving ordinary differential equations.
  - Euler's Method (`euler_method.cpp`, `euler_method.h`)
  - Runge-Kutta Methods (`runge_kutta_methods.cpp`, `runge_kutta_methods.h`)

- **PDE Solutions**: Contains methods for solving partial differential equations.
  - Finite Difference Method (`finite_difference_method.cpp`, `finite_difference_method.h`)

Each module contains a `.cpp` file with the implementation of the methods and a `.h` file with the declaration of the functions.

In addition to these modules, the `tests/` directory contains test files for each method, and `main.cpp` is the entry point for the application.

## Library Structure

```
my_library/
|-- root_finding/
| |-- bisection.cpp
| |-- bisection.h
| |-- newton_raphson.cpp
| |-- newton_raphson.h
|-- optimization/
| |-- gradient_descent.cpp
| |-- gradient_descent.h
|-- regression/
| |-- least_squares.cpp
| |-- least_squares.h
|-- interpolation/
|-- numerical_integration/
|-- ode_solutions/
|-- pde_solutions/
|-- tests/
| |-- test_bisection.cpp
| |-- test_newton_raphson.cpp
| |-- test_gradient_descent.cpp
| |-- test_least_squares.cpp
|-- main.cpp

```

## Dependencies

This library uses the Eigen library for matrix operations. You can download it [here](http://eigen.tuxfamily.org/index.php?title=Main_Page).

## Usage

Include the relevant header files in your code. For example, to use the bisection method and least squares regression, you would do:

```cpp
#include "Numerical-Methods-Cpp/root_finding/bisection.h"
#include "Numerical-Methods-Cpp/regression/least_squares.h"
```

Then, you can call the functions in your code:

```cpp
double root = bisection(my_function, a, b, tol);
std::vector<double> coefficients = least_squares(x_values, y_values);
```

