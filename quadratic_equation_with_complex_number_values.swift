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

func solveQuadratic(a: Double, b: Double, c: Double) -> QuadraticResult { // функція для обчислення квадратного рівння, як приймає значення трьох коефіцієнтів (числа з типом плавуючої коми) та повертає результат

    let discriminant: Double? = b * b - 4 * a * c // обчислення дикримінанту, тип Double? - означає, що значення може бути nil - оптиціональне 
    let d = discriminant ?? 0 // якщо значення дискримінанту == nil - буде 0, інакше беремо значення (d = discriminant або 0)

    let twoA = 2 * a // обчислення знаменника 

    if d >= 0 { // перевірка дискримінанту (умова, якщо дискримінант >= 0)
        let sqrtD = sqrt(d) // виводить корінь з дискримінанта 

        let x1 = Complex(real: (-b + sqrtD) / twoA, imag: 0) // обчислення першого кореня (уявної частини немає)
        let x2 = Complex(real: (-b - sqrtD) / twoA, imag: 0) // обчислення другого кореня (уявної частини немає)

        return QuadraticResult(type: .real, x1: x1, x2: x2) // повернення результату, тип результату real, з двома коренями

    } else { // в інакшому випадку, тобто якщо дискримінант менше 0
        let sqrtD = sqrt(-d) // беремо корінь з від'ємного дискримінанта 

        let realPart = -b / twoA // обрахунок дійсної частини коренів 
        let imagPart = sqrtD / twoA // обрахунок уявної частини 

        let x1 = Complex(real: realPart, imag: imagPart) // обчислення першного кореня уявної частини 
        let x2 = Complex(real: realPart, imag: -imagPart) // обчислення другого кореня уявної частини 

        return QuadraticResult(type: .complex, x1: x1, x2: x2) // повернення результату, тим complex, тобто обрахунок дискримінанта уявної частини 
    }
}

let result = solveQuadratic(a: 1, b: 2, c: 5) 

print(result.type)

print("x1 = \(result.x1.real) + \(result.x1.imag)i")
print("x2 = \(result.x2.real) + \(result.x2.imag)i")


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