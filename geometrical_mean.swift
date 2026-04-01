func average(of numbers: [Double]) -> Double {
    let reduce = numbers.reduce(1, *)
    let n = Double(numbers.count)
    return pow(reduce, 1.0 / n) 
}

let numbers = Array(1...120).map { Double($0) } 
let avg = average(of: numbers)

print("result \(avg)")