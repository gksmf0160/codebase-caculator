import UIKit

//1. Int타입의 temperature를 입력받아, 온도가 25도 이상이면 "덥다", 그렇지 않으면 "춥다"를 반환하는 함수를 삼항 연산자를 사용하여 작성하세요.
var temperature: Int = 26

print(temperature >= 25 ? "덥다" : "춥다")
//2. Int타입의 숫자를 입력받아, 그 숫자가 짝수인지 홀수인지 판별하는 함수를 작성하세요.
var num: Int = 10

print(num % 2 == 0 ? "짝수" : "홀수")
//3. Int타입의 age를 입력받아, 나이가 19세 이상이면 true, 그렇지 않으면 false를 반환하는 함수를 작성하세요.
var age: Int = 20

print(age >= 19 ? true : false)
//4. 두 개의 Double 타입 숫자 a와 b를 입력받아, a가 b보다 크면 true, 그렇지 않으면 false를 반환하는 함수를 작성하세요.
var a: Double = 10.0
var b: Double = 20.0

print(a > b ? true : false)


//5. isLoggedIn이라는 이름의 Bool 변수와 isAdmin 이름의 Bool 변수가 주어졌을 때, 사용자가 로그인되어 있고 동시에 관리자 권한을 가지고 있는지 확인하는 Bool 값을 반환하는 함수를 작성하세요.
var isLoggedIn: Bool = true
var isAdmin: Bool = false

print(isLoggedIn && isAdmin)
//6. String 타입의 문자열을 입력받아, 해당 문자열이 비어있으면 true, 비어있지 않으면 false를 반환하는 함수를 작성하세요. (Swift의 내장 isEmpty 속성을 사용하지 않고 직접 구현해 보세요.)
func isStringEmpty(_ input: String) -> Bool {
    return input.count == 0
}

//7. Bool 타입의 success 변수를 입력받아, sucess가 true 이면 "작업 성공!"을 출력하고 true를 반환하며, false이면 "작업 실패!"를 출력하고 false를 반환하는 함수를 작성하세요.
var Successs: Bool = true
func func1(Successs: Bool) -> String {
    if Successs == true {
        return "작업 성공!"
    }
    else{
            return "작업 실패!"
        }
    
}

//8. password(String)를 입력받아, 비밀번호가 8자 이상이고 ! 문자를 포함하는지 여부를 Bool로 반환하는 함수를 작성하세요.
func isValidPassword(_ password: String) -> Bool {
    return password.count >= 8 && password.contains("!")
}
