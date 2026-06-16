import Foundation // імпорт бібліотеки, що містить математичні типи та функції

@frozen // означає, що набір даних нижче випадків (case) з enam не буде змінюватись
enum MyOptional<Wrapped> { // створення перелічення, тобто це той тип даних, який може перебувати лише в одному з визначених станів, MyOptional<Wrapped> - узагальнений (generic) тип, Wrapped - параметр типу, тобто MyOptional може зберігати значення будь-якого типу (Int, String, Double)
    
    case none // означає, що значення відсутнє
    case some(Wrapped) // означає, що значення існує, всередині some зберігається об'єкт типу Wrapped
    
    init(_ value: Wrapped) { // конструктор, який дозволяє створити MyOptional, передавши знвичайне значення
        self = .some(value) // let x = MyOptional(5) еквівалентне let x = MyOptional.some(5)
    }
    
    init(nilLiteral: ()) { // ініціалізатор, який встановлює значення none
        self = .none 
    }
    
    var isNone: Bool { // оголошення властивості, що повертає true або false, відповідно до кінцевого значення
        if case .none = self { return true } // перевірка, чи поточний об'єкт self має стан none
        return false // якщо так - повертає true, в інакшому випадку - false
    }
    
    var isSome: Bool { // повертає протилежне значення до isNone
        return !isNone
    }

    func unwrap() -> Wrapped? { // цей метод повертає звичайний Optional   
        switch self { // перевіряє, яким є стан  MyOptional
        case .some(let value): // якщо є значення some - воно записується в змінну value
            return value // повертає дане значення
        case .none: // якщо значення відсутнє - повертає none
            return nil
        }
    }

    func map<U>(_ transform: (Wrapped) -> U) -> MyOptional<U> { // метод map застосовує функцію transform до значення, якщо воно існує, U - новий тип після перетворення 
        switch self { // перевірка, чи значення існує
        case .some(let value): // якщо значення існує - отримання його
            return .some(transform(value)) // застосування функції transform, результат повертається назад у some
        case .none: // якщо значення немає - none
            return .none
        }
    }

    func flatMap<U>(_ transform: (Wrapped) -> MyOptional<U>) -> MyOptional<U> { // функція transform сама повертає значення MyOptional
        switch self { 
        case .some(let value): // якщо є начення - викликається transform і повертається його результат
            return transform(value) 
        case .none: // якщо значення відсутнє - повертається none
            return .none
        }
    }

    static func ?? (lhs: MyOptional, rhs: @autoclosure () -> Wrapped) -> Wrapped { // реалізація ??
        switch lhs { 
        case .some(let value):
            return value
        case .none:
            return rhs()
        }
    }
}

extension MyOptional: Equatable where Wrapped: Equatable { // підтримка порівняння ==, можливо лише тоді, коли тип Wrapped підтримує Equatable
    static func == (lhs: MyOptional, rhs: MyOptional) -> Bool { // перевантаження оператора == 
        switch (lhs, rhs) { // одночасна перевірка обох значень
        case (.none, .none): // два порожніх значення вважаються рівними 
            return true 
        case (.some(let a), .some(let b)): // якщо обидва містять значення - їхнє порівняння 
            return a == b
        default: // їхні комбінації - не рівні (помилка)
            return false
        }
    }
}

let a: MyOptional<Int> = .some(10) // створення MyOptional, який містить число 10
let b: MyOptional<Int> = .none // створення MyOptional без значення

print(a.unwrap() as Any)  // повернення значення а
print(b.unwrap() as Any) // повернення значення b

let doubled = a.map { $0 * 2 } // $0 - 10, псля множення - отримуємо 20, тобто .some(20)
print(doubled.unwrap() as Any) // виведення даного результату 

let value = b ?? 100 // оскільки b = none, оператор ?? поверне значення за замовчуванням, тобто 100 
print(value) 