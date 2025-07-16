//
//  main.swift
//  오돌뼈
//
//  Created by 송명균 on 7/3/25.
//

import Foundation



/*우리는 간단한 **택배 도착 예측 시스템**을 만들고 있다고 가정합니다.

사용자에게 예상 도착일을 알려주려 하지만, 다음과 같은 여러 상황에서 문제가 발생할 수 있습니다:

- 주소가 잘못된 경우
- 배송이 아직 시작되지 않은 경우
- 시스템 서버 에러로 예측이 불가능한 경우
- [ ]  배송 상태를 표현하는 DeliveryStatus 열거형을 구현하고, 아래 3가지 상태를 포함하도록 합니다.
    - notStarted
    - inTransit(daysRemaining: Int)
    - error
- [ ]  사용자 정의 에러 타입 DeliveryError를 Error 프로토콜을 따르도록 정의합니다.
    - invalidAddress
    - notStarted
    - systemError(reason: String)
- [ ]  아래 시그니처를 가진 throwing function 을 구현해봅니다.
    
    ```swift
    func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String
    ```
    
    - 주소가 빈 문자열이면 DeliveryError.invalidAddress를 던져야 합니다.
    - 배송이 아직 시작되지 않은 경우 DeliveryError.notStarted를 던져야 합니다.
    - 시스템 에러 상태면 DeliveryError.systemError(reason:)을 던져야 합니다.
    - 나머지 경우에는 "배송까지 X일 남았습니다." 형태의 문자열을 반환합니다.
- [ ]  위 함수를 do-catch 로 호출하고, 각 에러 상황에 따라 사용자에게 다른 메시지를 출력하세요. */
/*enum DeliveryStatus {
    case notStarted
    case inTransit(daysRemaining: Int)
    case error
}

enum DeliveryError: Error {
    case invalidAddress
    case notStarted
    case systemError(reason: String)
}

func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String {
    if address.isEmpty {
        throw DeliveryError.invalidAddress
    }
    
    switch status {
    case .notStarted:
        throw DeliveryError.notStarted
    case .error:
        throw DeliveryError.systemError(reason: "시스템 에러가 발생했습니다.")
    case .inTransit(let daysRemaining):
        return "배송까지 \(daysRemaining)일 남았습니다."
    }
}

let address = "경상북도 구미시"
let status: DeliveryStatus = .inTransit(daysRemaining: 5)
do {
    let prediction = try predictDeliveryDay(for: address, status: status)
    
}catch DeliveryError.invalidAddress {
    print( "주소가 유효하지 않습니다.")
    
}catch DeliveryError.notStarted{
    print("배송이 시작되지 않았습니다.")
    
}catch DeliveryError.systemError(reason: let reason){
    print("시스템 에러: \(reason)")
}*/

/*### 도전 문제 1

- ‘자동차’ 라는 개념을 가지고 객체 지향 설계를 해봅니다.
    - [ ]  Base Class `Car` 를 설계해주세요.
        - 4가지의 상태를 정의해주세요.
            - 브랜드, 모델, 연식
                - 모두 String 타입입니다.
            - 엔진
                - Engine 이라는 커스텀 타입으로 정의해주세요.
        - 1개의 동작을 정의해주세요.
            - 운전하기
                - 동작 예시) “Car 주행 중…”  출력
        - 추가하고 싶은 상태와 동작은 마음껏 추가해주세요.
            - stop(), charge(), refuel() 등..
        - 정의한 각 상태 및 동작에 적절한 접근 제어자를 명시적으로 지정해주세요.
    - [ ]  `Car` 를 상속한 `ElectricCar` 를 설계해주세요.
        - ElectricEngine 타입의 Engine 을 사용해야합니다.
    - [ ]  `Car` 를 상속한 `HybridCar` 를 설계해주세요.
        - 새로운 엔진 타입 `HydrogenEngine` 을 정의해주세요.
        - HybridCar 에는 기존 Car 에 없던 새로운 동작이 추가됩니다.
            - 엔진을 런타임에 바꿀 수 있는 `switchEngine(to:)` 입니다.
    - [ ]  `HybridCar` 인스턴스를 생성하고, `switchEngine(to:)` 를 호출하여 서로 다른 타입의 엔진으로 교체하는 코드를 작성해주세요.
    - [ ]  상속을 사용하여 기능을 추가하는 것과, 프로토콜 채택을 통해서 기능을 추가하는 것의 장단점, 차이를 고민하고 주석으로 서술해주세요.*/
