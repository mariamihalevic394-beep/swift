func average(of numbers: [Double]) -> Double {
    let sum = numbers.reduce(0, +)
    return sum / Double(numbers.count)
}

let numbers = Array(1...120).map { Double($0) }   // масив Double
let avg = average(of: numbers)

print("Average number is: \(avg)")