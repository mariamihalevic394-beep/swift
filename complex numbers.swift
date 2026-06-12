import Foundation // імпорт бібліотеки, яка надає додаткові типи даних 

struct Complex { // оголошення нової структури Complex, :Equatable означає, що екземпляри можна можна порівнювати оператором ==
    var real: Double // дійсна частина комплексного числа
    var imaginary: Double // уявна частина компоексного числа

    init(real: Double, imaginary: Double) { // init - інііалізатор структури або класу, що викликається під час створення нового об'єкта 
        self.real = real // параметр ініціалізатора, що приймає значення типу Double, дійсне число 
        self.imaginary = imaginary // уявне число, також параметр ініціалізатора, що приймає значення типу Double 
    }

    func description() -> String { // оголошення методу description, він повертає текстовий рядок
        if imaginary >= 0 { // перевірка уявної частини, чи вона не від'ємна 
            return "\(real) + \(imaginary)i"  // якщо уявне число >= 0, то поверає рядок 3.0 + 2.0i
        } else { // якщо умова не справджується 
            return "\(real) - \(-imaginary)i" // то поверає 3.0 - 2.0i
        }
    }
}

let z1 = Complex(real: 2, imaginary: 3)
let z2 = Complex(real: 1, imaginary: 4)

print(z1.description()) 
print(z2.description()) 
