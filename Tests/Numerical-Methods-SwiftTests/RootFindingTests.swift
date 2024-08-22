import XCTest
@testable import NumericalMethods

final class RootFindingTests: XCTestCase {

    let tolerance: Double = 1e-6

    func testBisectionMethod() {
        let bisection = Bisection()

        // Test case 1: f(x) = x^2 - 2, root should be √2
        measure(function: { x in x * x - 2 },
                method: bisection.findRoot,
                initialValue: (1...2),
                expectedResult: sqrt(2),
                name: "Bisection: x^2 - 2")

        // Test case 2: f(x) = x^3 - x - 2, root should be about 1.521
        measure(function: { x in x * x * x - x - 2 },
                method: bisection.findRoot,
                initialValue: (1...2),
                expectedResult: 1.521,
                name: "Bisection: x^3 - x - 2")

        // Test case 3: f(x) = sin(x), root should be 0
        measure(function: sin,
                method: bisection.findRoot,
                initialValue: (-1...1),
                expectedResult: 0,
                name: "Bisection: sin(x)")

        // Test error case: no root in interval
        XCTAssertThrowsError(try bisection.findRoot(of: { x in x * x + 1 }, in: -1...1)) { error in
            XCTAssertEqual(error as? Bisection.BisectionError, .noRootInInterval)
        }
    }

    func testNewtonRaphsonMethod() {
        let newtonRaphson = NewtonRaphson()

        // Test case 1: f(x) = x^2 - 2, root should be √2
        measure(function: { x in x * x - 2 },
                method: newtonRaphson.findRoot,
                initialValue: 1.5,
                expectedResult: sqrt(2),
                name: "Newton-Raphson: x^2 - 2")

        // Test case 2: f(x) = x^3 - x - 2, root should be about 1.521
        measure(function: { x in x * x * x - x - 2 },
                method: newtonRaphson.findRoot,
                initialValue: 1.5,
                expectedResult: 1.521,
                name: "Newton-Raphson: x^3 - x - 2")

        // Test case 3: f(x) = sin(x), root should be 0
        measure(function: sin,
                method: newtonRaphson.findRoot,
                initialValue: 0.5,
                expectedResult: 0,
                name: "Newton-Raphson: sin(x)")

        // Test error case: derivative too close to zero
        XCTAssertThrowsError(try newtonRaphson.findRoot(of: { x in x * x * x }, initialGuess: 0)) { error in
            XCTAssertEqual(error as? NewtonRaphson.NewtonRaphsonError, .derivativeTooCloseToZero)
        }
    }

    private func measure<T: BinaryFloatingPoint>(
        function: @escaping (Double) -> Double,
        method: (((Double) -> Double, T, Double, Int) throws -> Double),
        initialValue: T,
        expectedResult: Double,
        name: String
    ) {
        do {
            let startTime = DispatchTime.now()
            let result = try method(function, initialValue, tolerance, 100)
            let endTime = DispatchTime.now()

            let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
            let timeInterval = Double(nanoTime) / 1_000_000_000

            XCTAssertEqual(result, expectedResult, accuracy: tolerance)
            print("\(name) took \(timeInterval) seconds")
        } catch {
            XCTFail("\(name) failed: \(error)")
        }
    }
}
