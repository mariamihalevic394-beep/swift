import Foundation // імпорт бібліотеки, що надає додаткові типи даних, базові математичні функції 

struct Complex<T: FloatingPoint> { // створення стурктури Complex, тип Т - узагальнений тип даних, FloatingPoint - означає, що структура не прив'язана до одного типк чисел, тобто може бути як і Double, так і Float, але не Int
    var real: T // дійсна частина комплексного числа, яка може бути одним із двох типів 
    var imag: T // уявна частина комплексного числа, яка може бути один із двох вказаних типів 
}

enum RootType { // створення переліку можливих типів результату 
    case real // перший варіант - коли корені без уявної частини 
    case complex // 2 - коли корені з уявною частиною 
}

struct QuadraticResult { // стоврення контейнеру для результату функції 
    let type: RootType // створення типу коренів: real або complex
    let x1: Complex<Double> // корінь х1, що прив'язаний до структури Complex  та має тип значення числа - з плавоючою комою 
    let x2: Complex<Double> // корінь х2, що прив'язаний до структури Complex  та має тип значення числа - з плавоючою комою 
}

// Обчислення квадратного кореня
func squareRoot(of value: Double) -> Double {
    return sqrt(value)
}

// Обчислення квадратного кореня від модуля числа
func squareRootOfAbsoluteValue(of value: Double) -> Double {
    return sqrt(abs(value))
}

// Розв'язання лінійного рівняння bx + c = 0 (коли a == 0)
func solveLinearEquation(b: Double, c: Double) -> Complex<Double> {
    if b == 0 {
        // Якщо b == 0, повертаємо NaN, оскільки рівняння не має
        // єдиного розв'язку
        return Complex(real: Double.nan, imag: 0)
    }

    return Complex(real: -c / b, imag: 0)
}

func solveQuadratic(a: Double, b: Double, c: Double) -> QuadraticResult { // функція для обчислення квадратного рівння, як приймає значення трьох коефіцієнтів (числа з типом плавуючої коми) та повертає результат

    if a == 0 {
        let root = solveLinearEquation(b: b, c: c)

        return QuadraticResult(
            type: .real,
            x1: root,
            x2: root
        )
    }

    let discriminant = b * b - 4 * a * c // обчислення дикримінанту, тип Double? - означає, що значення може бути nil - оптиціональне 
  

    let twoA = 2 * a // обчислення знаменника 

    if discriminant >= 0 { // перевірка дискримінанту (умова, якщо дискримінант >= 0)
  let sqrtD = squareRoot(of: discriminant) // виводить корінь з дискримінанта 

        let x1 = Complex(real: (-b + sqrtD) / twoA, imag: 0) // обчислення першого кореня (уявної частини немає)
        let x2 = Complex(real: (-b - sqrtD) / twoA, imag: 0) // обчислення другого кореня (уявної частини немає)

        return QuadraticResult(type: .real, x1: x1, x2: x2) // повернення результату, тип результату real, з двома коренями

    } else { // в інакшому випадку, тобто якщо дискримінант менше 0
  let sqrtD = squareRootOfAbsoluteValue(of: discriminant) // беремо корінь з від'ємного дискримінанта 

        let realPart = -b / twoA // обрахунок дійсної частини коренів 
        let imagPart = sqrtD / twoA // обрахунок уявної частини 

        let x1 = Complex(real: realPart, imag: imagPart) // обчислення першного кореня уявної частини 
        let x2 = Complex(real: realPart, imag: -imagPart) // обчислення другого кореня уявної частини 

        return QuadraticResult(type: .complex, x1: x1, x2: x2) // повернення результату, тим complex, тобто обрахунок дискримінанта уявної частини 
    }
}

func printComplex(_ z: Complex<Double>, name: String) {
    // Якщо число дорівнює -0.0 або 0.0, виводимо 0.0
    let real = (z.real == 0) ? 0.0 : z.real

    if z.imag >= 0 {
        print("\(name) = \(real) + \(z.imag)i")
    } else {
        print("\(name) = \(real) - \(-z.imag)i")
    }
}

let result = solveQuadratic(a: 1, b: 2, c: 5) 

print(result.type)

printComplex(result.x1, name: "x1")
printComplex(result.x2, name: "x2")

/* 
a, b, c
   ↓
обчислення D
   ↓
if D >= 0
   → real roots (imag = 0)
else
   → complex roots (±i)
   ↓
return QuadraticResult
*/