import Foundation // імпорт бібліотеки, яка надає додаткові типи даних 

struct Complex: Equatable { // оголошення нової структури Complex, :Equatable означає, що екземпляри можна можна порівнювати оператором ==
    var real: Double // дійсна частина комплексного числа
    var imag: Double // уявна частина компоексного числа


// Додавання 
static func + (lhs: Complex, rhs: Complex) -> Complex { // функція static належить самій структурі Complex, а не окремомоу об'єкту, func - оглошення функція, + - ім'я функції, яке перевантажує оператор +, lhs(left-hand side) - лівий оперант(дійсна частина ), rhs - правий оперант(уявна частина), -> Complex - функція повертає новий об'єкт типу Complex
    return Complex( // повернення резльтату роботи функції, Complex (...) - створює новий екземпляр структури Complex 
        real: lhs.real + rhs.real, // обчислення нової дійсної частини
        imag: lhs.imag + rhs.imag // обчислення нової уявної частини 
    )
} 

//Віднімання 
static func - (lhs: Complex, rhs:Complex) -> Complex { // оголошення функції - з дійсною та уявною частинами 
    return Complex( // повернення результату роботи та створення нового екземпляру Compl.ex
        real: lhs.real - rhs.real, // обчислення дійсної частини 
        imag: lhs.imag - rhs.imag // обчислення уявної частини 
    )
}

// Множення
static func * (lhs: Complex, rhs: Complex) -> Complex { // оголошення функції * з дійсною та уявною частинами 
    return Complex( // повернення результату роботи та створення нового екземпляру Complex 
        real: (lhs.real * rhs.real - lhs.imag * rhs.imag), // обчтслення дйсної частини 
        imag: (lhs.imag * rhs.real + lhs.real * rhs.imag) // обчислення уявної частини 
    )
}

// Ділення
static func / (lhs: Complex, rhs: Complex) -> Complex { // оголошення функції ділення з дійсною та уявною частинами
    let denominator = rhs.real * rhs.real + rhs.imag * rhs.imag // обчислення знас=менника с^2 + d^2

    return Complex( // поверення результату та сворення нового екземпляру Complex 
        real: (lhs.real * rhs.real + lhs.imag * rhs.imag) / denominator, // обчислення дійсної частини компщлексного числа 
        imag: (lhs.imag * rhs.real - lhs.real * rhs.imag) / denominator // обчислення уявної частини 
    )
}

// Рядкове предствалення 
    func description() -> String { // оголошення методу description, він повертає текстовий рядок 
        if imag >= 0 { // перевірка уявної частини, чи вона не від'ємна 
            return "\(real) + \(imag)i" // якщо уявне число >= 0, то поверає рядок 3.0 + 2.0i
        } else { // якщо умова не справджується 
            return "\(real) - \(-imag)i" // то поверає 3.0 - 2.0i
        }
    }
}

let z1 = Complex(real: 3, imag: 2)
let z2 = Complex(real: 1, imag: 4)

let sum = z1 + z2
let diff = z1 - z2
let product = z1 * z2
let quotient = z1 / z2

print("z1 = \(z1.description())")
print("z2 = \(z2.description())")
print("z1 + z2 = \(sum.description())")
print("z1 - z2 = \(diff.description())")
print("z1 * z2 = \(product.description())")
print("z1 / z2 = \(quotient.description())")