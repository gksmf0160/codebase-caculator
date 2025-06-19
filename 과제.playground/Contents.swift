import UIKit


//과제 1~2
/* class Calculator{
    // 더하기
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    
    // 곱하기
    func multiply(a: Int, b: Int) -> Int {
        return a * b
    }
    
    // 나누기
    func divide(a: Int, b: Int) -> Int {
        return a / b
    }
    
    // 빼기
    func subtract(a: Int, b: Int) -> Int {
        return a - b
    }
    
    //나머지 연산
    func modulo(a: Int, b: Int) -> Int {
        guard b != 0 else{
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a % b
    }
}

// 인스턴스 생성
let calc = Calculator()

// 메서드 호출 및 결과 출력
let result1 = calc.add(a: 5, b: 6)
print("더하기 결과: \(result1)")

let result2 = calc.multiply(a: 5, b: 6)
print("곱하기 결과: \(result2)")

let result3 = calc.divide(a: 12, b: 4)
print("나누기 결과: \(result3)")

let result4 = calc.subtract(a: 10, b: 3)
print("빼기 결과: \(result4)")

let result5 = calc.modulo(a: 4, b: 5)
print("나머지 결과: \(result5)")

//예외처리
let result6 = calc.modulo(a: 4, b: 0)*/

//과제 3~4
      //더하기
class AddOperation{
    func operate( a: Double,  b: Double) -> Double {
        return a + b
    }
}
       //빼기
class SubtractOperation {
    func operate( a: Double,  b: Double) -> Double {
        return a - b
    }
}
       //곱하기
class MultiplyOperation {
    func operate( a:Double,  b: Double) -> Double {
        return a * b
    }
}
       //나누기
class DivideOperation {
    func operate( a: Double, b: Double) -> Double {
        guard b != 0 else {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a / b
    }
}
       //나머지 연산
class ModuloOperation{
    func operate( a: Int, b: Int) -> Int{
        guard b != 0 else {
            print("0으로 나눌 수 없습니다.")
            return 0
        }
        return a % b
    }
}
//인스턴스 생성
class Calculator{
    let add = AddOperation()
    let substract = SubtractOperation ()
    let module = ModuloOperation()
    let divide = DivideOperation()
    let multiply = MultiplyOperation()
    
}
let calc = Calculator()


print(calc.add.operate(a:10 ,b:20))
print(calc.substract.operate(a:50 ,b:20))
print(calc.module.operate(a:10 ,b:3))
print(calc.divide.operate(a:20 ,b:4))
print(calc.multiply.operate(a:4 ,b:5))

//예외처리
print(calc.module.operate(a:10 ,b:0))
print(calc.divide.operate(a:20 ,b:4))
