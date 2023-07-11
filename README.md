# Numerical Methods Library in C++

This is a C++ library implementing various numerical methods for root finding, optimization, regression, interpolation, numerical integration, and solving ordinary and partial differential equations.

## Methods Implemented

- Root Finding: Bisection, Newton's Method, etc.
- Optimization: Gradient Descent, etc.
- Regression: Least Squares, etc.
- Interpolation: Lagrange Interpolation, etc.
- Numerical Integration: Trapezoidal Rule, Simpson's Rule, etc.
- ODE Solutions: Euler's Method, Runge-Kutta Methods, etc.
- PDE Solutions: Finite Difference Method, etc.

## Dependencies

This library uses the Eigen library for matrix operations. You can download it [here](http://eigen.tuxfamily.org/index.php?title=Main_Page).

## Usage

Include the relevant header files in your code. For example, to use the bisection method and least squares regression, you would do:

```cpp
#include "my_library/root_finding/bisection.h"
#include "my_library/regression/least_squares.h"
```

Then, you can call the functions in your code:

```cpp
double root = bisection(my_function, a, b, tol);
std::vector<double> coefficients = least_squares(x_values, y_values);
```

