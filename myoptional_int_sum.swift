import Foundation

enum MyOptional<T> {
    case some(T)
    case none
}

func sum(_ first: MyOptional<Int>,
_ second: MyOptional<Int>) -> MyOptional<Int> {
    switch (first, second) {
        case (.some(let value1), .some(let value2)):
        return .some(value1 + value2)

        default:
        return .none
    }
}

let number1: MyOptional<Int> = .some(10)
let number2: MyOptional<Int> = .some(20)

let result1 = sum(number1, number2)

switch result1 {
    case .some(let value):
        print("Сума = \(value)")
    case .none:
        print("Неможливо обчислити суму")
}

let number3: MyOptional<Int> = .none
let result2 = sum(number1, number3)

switch result2 {
    case .some(let value):
        print("Сума = \(value)")
    case .none:
        print("Одне із значень відсутнє")
}
