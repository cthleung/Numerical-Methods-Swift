import Foundation

// This file contains two numerical root finding functions: the bisection method and the Newton-Raphson method.

// //Bisection Method
// public struct Bisection {

//     public enum BisectionError: Error { // Error type for the bisection method
//         case noRootInInterval // No root in the given interval
//         case maxIterationsReached // Maximum number of iterations reached
//     }

//     public init() {}

//     /// Finds a root of the given function using the bisection method.
//     /// - Parameters:
//     ///   - f: The function whose root we want to find.
//     ///   - a: The left endpoint of the interval.
//     ///   - b: The right endpoint of the interval.
//     ///   - tol: The tolerance for the root approximation. Default is 1e-6.
//     ///   - maxIter: The maximum number of iterations. Default is 100.
//     /// - Returns: The approximate root of the function.
//     /// - Throws: `BisectionError.noRootInInterval` if f(a) and f(b) have the same sign.
//     ///           `BisectionError.maxIterationsReached` if the maximum number of iterations is reached without finding a root.

//     public func findRoot(of f: (Double) -> Double, in interval: ClosedRange<Double>, tol: Double = 1e-6, maxIter: Int = 100) throws -> Double {
//         var left = interval.lowerBound
//         var right = interval.upperBound

//         // Check if a root exists in the given interval
//         guard f(left) * f(right) < 0 else {
//             throw BisectionError.noRootInInterval
//         }

//         for _ in 0..<maxIter {
//             let mid = (left + right) / 2
//             let fMid = f(mid)

//             if abs(fMid) < tol {
//                 return mid  // Root found
//             }

//             if f(left) * fMid < 0 {
//                 right = mid  // Root is in the left half
//             } else {
//                 left = mid   // Root is in the right half
//             }
//         }

//         throw BisectionError.maxIterationsReached
//     }

public struct Bisection {

    public enum BisectionError: Error {
        case noRootInInterval
        case maxIterationsReached
    }

    public init() {}

    /// Function to find a root of the given function using the bisection method.
    /// - Parameters:
    ///   - f: The function whose root we want to find.
    ///   - interval: The closed range in which to search for the root.
    ///   - tol: The tolerance for the root approximation. Default is 1e-6.
    ///   - maxIter: The maximum number of iterations. Default is 100.
    /// - Returns: The approximate root of the function.
    /// - Throws: `BisectionError.noRootInInterval` if f(a) and f(b) have the same sign,
    ///           `BisectionError.maxIterationsReached` if the maximum number of iterations is reached without finding a root.

    public func findRoot(of f: (Double) -> Double, in interval: ClosedRange<Double>, tol: Double = 1e-6, maxIter: Int = 100) throws -> Double {
        var left = interval.lowerBound
        var right = interval.upperBound

        // Check if a root exists in the given interval
        guard f(left) * f(right) < 0 else {
            throw BisectionError.noRootInInterval
        }

        var iterations = 0
        while right - left > tol && iterations < maxIter {
            let mid = (left + right) / 2
            let fMid = f(mid)

            if abs(fMid) < tol {
                return mid  // Root found
            }

            if f(left) * fMid < 0 {
                right = mid  // Root is in the left half
            } else {
                left = mid   // Root is in the right half
            }

            iterations += 1
        }

        // Check if we've converged to a root
        if right - left <= tol {
            return (left + right) / 2
        }

        throw BisectionError.maxIterationsReached
    }
}


//Example usage of the Bisection() function
// let bisection = Bisection()
// let root = try bisection.findRoot(of: { x in x * x - 4 }, in: 0.0...1.0, tol: 1e-6, maxIter: 100)
// print("Approximate root: \(root)")


// In the provided code, of: is a parameter label used in a function call. It specifies the closure or function that represents the mathematical expression whose root we want to find.

// In Swift, closures are a way to define anonymous functions. They are enclosed in curly brackets {}. In this case, the closure { x in x * x - 4 } represents the mathematical expression x * x - 4. The closure takes a single parameter x and returns the result of the expression.

// By passing the closure as an argument to the findRoot function, we are telling the function to use this mathematical expression to find the root. The closure will be called repeatedly by the findRoot function, with different values of x, until it finds a root or reaches the maximum number of iterations.

// So, in summary, the of: parameter specifies the closure or function that represents the mathematical expression, and the curly brackets are used to define the closure itself.

import Foundation

public struct NewtonRaphson {

    public enum NewtonRaphsonError: Error {
        case derivativeTooCloseToZero
        case maxIterationsReached
    }

    /// The step size for numerical derivative computation
    private let h: Double = 1e-5

    public init() {}

    /// Computes the numerical derivative of a function at a point
    /// - Parameters:
    ///   - f: The function to differentiate
    ///   - x: The point at which to compute the derivative
    /// - Returns: The approximate derivative of f at x
    private func numericalDerivative(of f: @escaping (Double) -> Double, at x: Double) -> Double {
        return (f(x + h) - f(x - h)) / (2 * h)
    }

    /// Finds a root of the given function using the Newton-Raphson method
    /// - Parameters:
    ///   - f: The function whose root we want to find
    ///   - initialGuess: The starting point for the algorithm
    ///   - tol: The tolerance for the root approximation. Default is 1e-6.
    ///   - maxIter: The maximum number of iterations. Default is 100.
    /// - Returns: The approximate root of the function
    /// - Throws: `NewtonRaphsonError.derivativeTooCloseToZero` if the computed derivative is too close to zero
    ///           `NewtonRaphsonError.maxIterationsReached` if the maximum number of iterations is reached without finding a root
    public func findRoot(of f: @escaping (Double) -> Double,
                         initialGuess: Double,
                         tol: Double = 1e-6,
                         maxIter: Int = 100) throws -> Double {
        var x = initialGuess

        for _ in 0..<maxIter {
            let fx = f(x)
            let fPrimeX = numericalDerivative(of: f, at: x)

            if abs(fPrimeX) < tol {
                throw NewtonRaphsonError.derivativeTooCloseToZero
            }

            let nextX = x - fx / fPrimeX

            if abs(nextX - x) < tol {
                return nextX  // Root found
            }

            x = nextX
        }

        throw NewtonRaphsonError.maxIterationsReached
    }
}
