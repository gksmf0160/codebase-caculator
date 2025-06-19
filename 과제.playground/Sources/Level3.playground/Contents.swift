class AddOperation {
  func add(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 + number2)
  }
}

class SubstractOperation {
  /// https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_markup_formatting_ref/
  /**
    - parameters:
    - number1: 빼기 연산자의 왼쪽에 오는 수
    - number2: 빼기 연산자의 오른쪽에 오는 수
   */
  func minus(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 - number2)
  }
}

class MultiplyOperation {
  func multiply(_ number1: Int, _ number2: Int) -> Double {
    Double(number1 * number2)
  }
}

class DivideOperation {
  func divide(_ number1: Int, _ number2: Int) -> Double {
    
    guard number2 != 0 else {
      return 0.0
    }
    
    return Double(number1) / Double(number2)
  }
}

class Calculator {
  let addOperation = AddOperation()
  let substractOperation = SubstractOperation()
  let multiplyOperation = MultiplyOperation()
  let divideOperation = DivideOperation()
  
  func operate(_ operator: OperatorType, _ number1: Int, _ number2: Int) -> Double {
    switch `operator` {
    case .add:
      return addOperation.add(number1, number2)
    case .substract:
      return substractOperation.minus(number1, number2)
    case .multiply:
      return multiplyOperation.multiply(number1, number2)
    case .divide:
      return divideOperation.divide(number1, number2)
    }
  }
}

enum OperatorType {
  case add
  case substract
  case multiply
  case divide
}

let calculator = Calculator() // 인스턴스 생성하여 변수에 할당

calculator.operate(.add, 1, 2)           // 3
calculator.operate(.substract, 1, 2)     // -1
calculator.operate(.multiply, 3, 5)      // 15
calculator.operate(.divide, 1, 3)        // 0.333333


