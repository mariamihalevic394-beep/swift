import Foundation // підключення бібліотеки математичних функцій

enum quadratic_equation1Error: Error { // enum - перелік можливих значень, quadratic_equation1Error - назва типу помилки, : Error - означає, що enum відповідає протоколу Error
    case negativeDiscriminant(value: Double) // виконання Associated Value (перший тип помилки), разом з помилкою передається значення дискримінанта
}

func quadratic_equation1(a: Double, b: Double, c: Double) throws -> (Double, Double) { // виклик функції, значення - дробові числа(Double), throws -> (Double, Double) - можлива помилка кінцквих значень + вивеження коренів функція tuple
    
    let discriminant = b * b - 4 * a * c // обчислення дискримінанту
    
    if discriminant < 0 { // якщо значення дисткримінанту <0
        throw quadratic_equation1Error.negativeDiscriminant(value: discriminant) // виведення помилки (немає дійсних коренів), замість обчислення використовується  throw + виведення від'ємного значення + зупинення виконання програми 
    }
    
    let x1 = (-b - sqrt(discriminant)) / (2 * a)
    let x2 = (-b + sqrt(discriminant)) / (2 * a)
    
    return (x1, x2)
} 

do { // блок, де може виконуватися помилка 
    let result = try quadratic_equation1(a: 1, b: -3, c: 2) // спроба виконання функції
    print("Корені: \(result.0), \(result.1)") // використання tuple 
    
} catch quadratic_equation1Error.negativeDiscriminant(let value) { // якщо результат від'ємний - виведення помилки з відповідним значенням дискримінанту 
    print("Помилка: дискримінант < 0 (D = \(value))")
    
} catch {
    print("Інша помилка")
}