import Foundation

//1. Student 구조체가 있고, 이 구조체는 midtermScore라는 옵셔널 Int 타입의 속성을 가질 수 있습니다. 특정 학생의 중간고사 점수가 있다면 그 점수를 출력하고, 없다면 "점수 없음"을 출력하세요.
struct Student {
    var midtermScore: Int?
}

let student = Student(midtermScore: 85)

if let score = student.midtermScore {
    print("중간고사 점수: \(score)")
} else {
    print("점수 없음")
}

//2. Book 클래스가 있고, 이 클래스는 title이라는 옵셔널 String 타입의 속성을 가집니다. 책의 제목이 있다면 그 제목의 길이를 출력하고, 없다면 "제목 없음"을 출력하세요.
class Book {
    var title: String?
}

let book = Book()
book.title = "Swift Programming"

if let title = book.title {
    print("제목 길이: \(title.count)")
} else {
    print("제목 없음")
}

//3. User 구조체가 있고, 이 구조체는 email이라는 옵셔널 String 타입의 속성을 가집니다. 사용자의 이메일이 있다면 이메일에서 @ 기호 이후의 도메인 부분을 추출하여 출력하고, 이메일이 없다면 "이메일 없음"을 출력하세요.
struct User {
    var email: String?
}

let user = User(email: "hello@example.com")

if let email = user.email,
   let atIndex = email.firstIndex(of: "@") {
    let domain = email[email.index(after: atIndex)...]
    print("도메인: \(domain)")
} else {
    print("이메일 없음")
}

//4. Company 구조체는 Department라는 옵셔널 속성을 가집니다. Department는 managerName이라는 옵셔널 String 속성을 가집니다. 회사의 특정 부서에 책임자가 있다면 그 이름을 출력하고, 없다면 "책임자 없음"을 출력하세요.
struct Department {
    var managerName: String?
}

struct Company {
    var department: Department?
}

let company = Company(department: Department(managerName: "김철수"))

if let managerName = company.department?.managerName {
    print("책임자: \(managerName)")
} else {
    print("책임자 없음")
}

//5. ParkingLot 구조체는 vehicles라는 옵셔널 [Car] 배열을 가집니다. Car 구조체는 licensePlate라는 옵셔널 String 속성을 가집니다. 주차장에 첫 번째 차량이 있고 그 차량에 번호판이 있다면 번호판을 출력하고, 그렇지 않다면 "차량 없음 또는 번호판 없음"을 출력하세요.
struct Car {
    var licensePlate: String?
}

struct ParkingLot {
    var vehicles: [Car]?
}

let lot = ParkingLot(vehicles: [Car(licensePlate: "123가4567")])

if let plate = lot.vehicles?.first?.licensePlate {
    print("번호판: \(plate)")
} else {
    print("차량 없음 또는 번호판 없음")
}
