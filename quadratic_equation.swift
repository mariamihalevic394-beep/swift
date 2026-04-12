import Foundation 

func quadratic_equation(a: Double, b: Double, c: Double) {
    let discriminant = b * b - 4 * a * c

    if discriminant > 0 {
        let x1 = (-b - sqrt(discriminant)) / (2 * a)
        let x2 = (-b + sqrt(discriminant)) / (2 * a)
        print("Два корені: \(x1), \(x2)" )

    } else if discriminant == 0 {
        let x = -b / (2 * a)
        print("Один корінь: \(x)" )
        
    } else {
        print("Немає дійсних коренів")
    }
} 

quadratic_equation(a: 1, b: 2, c: 1)
