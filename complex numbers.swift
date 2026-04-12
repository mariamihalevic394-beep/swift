import Foundation

struct Complex {
    var real: Double
    var imaginary: Double
}

extension Complex {
    func add(_ other: Complex) -> Complex {
        return Complex(
            real: self.real + other.real,
            imaginary: self.imaginary + other.imaginary
        )
    }
}

extension Complex {
    func subtract(_ other: Complex) -> Complex {
        return Complex(
            real: self.real - other.real,
            imaginary: self.imaginary - other.imaginary
        )
    }
}

extension Complex {
    func multiply(_ other: Complex) -> Complex {
        return Complex(
            real: self.real * other.real - self.imaginary * other.imaginary,
            imaginary: self.real * other.imaginary + self.imaginary * other.real 
        )
    }
}

extension Complex {
    func divide(_ other: Complex) -> Complex {
        let denominator = other.real * other.real + other.imaginary * other.imaginary
        
        return Complex(
            real: (self.real * other.real + self.imaginary * other.imaginary) / denominator,
            imaginary: (self.imaginary * other.real - self.real * other.imaginary) / denominator
        )
    }
}

let z1 = Complex(real: 2, imaginary: 3)
let z2 = Complex(real: 1, imaginary: 4)

let sum = z1.add(z2)
let diff = z1.subtract(z2)
let product = z1.multiply(z2)
let quotient = z1.divide(z2)

print("Сума: \(sum.real) + \(sum.imaginary)i")
print("Різниця: \(diff.real) - \(diff.imaginary)i")
print("Добуток: \(product.real) * \(product.imaginary)i")
print("Частка: \(quotient.real) / \(quotient.imaginary)i")