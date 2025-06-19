//
//  BaseballGame.swift
//  숫자야구
//
//  Created by 송명균 on 6/9/25.
//
// 1-3 과제
/*import Foundation
 
 
 
 class BaseballGame {

     private var answer: [Int] = [] // 정답을 저장할 배열



     // 게임 시작

     func start() {

         print("환영합니다! 숫자 야구 게임을 시작합니다.")

         answer = makeAnswer() // 정답 생성

         // print("정답 (테스트용): \(answer)") // 개발/테스트 시 정답 확인용



         var attempts = 0 // 시도 횟수

         var isGameEnded = false // 게임 종료 여부



         while !isGameEnded {

             attempts += 1

             print("\n\(attempts)번째 시도:")

             print("세 자리 숫자를 입력하세요 (예: 123): ", terminator: "")



             guard let input = readLine(),

                   let playerGuess = validateInput(input) else {

                 print("⚠️ 올바른 세 자리 숫자를 입력해주세요. (중복 불가, 1-9 사이)")

                 continue

             }



             let (strikes, balls) = checkGuess(playerGuess)



             if strikes == 3 {

                 print("🎉 축하합니다! 정답을 맞히셨습니다: \(answer.map { String($0) }.joined())")

                 print("총 \(attempts)번 만에 맞히셨습니다!")

                 isGameEnded = true

             } else {

                 print("결과: \(strikes) 스트라이크, \(balls) 볼")

             }

         }

         print("게임이 종료되었습니다. 다시 시작하려면 프로그램을 재실행하세요.")

     }



     //  난수 생성

     private func makeAnswer() -> [Int] {

         var numbers = Array(1...9) // 1부터 9까지의 숫자 배열

         numbers.shuffle() // 배열 섞기

         return Array(numbers.prefix(3)) // 앞에서 3개만 선택하여 정답으로 사용

     }



     // 사용자 입력 유효성 검사

     private func validateInput(_ input: String) -> [Int]? {

         guard input.count == 3 else {

             return nil // 3자리 숫자가 아님

         }



         var uniqueNumbers = Set<Int>()

         var guessNumbers: [Int] = []



         for char in input {

             guard let number = Int(String(char)),

                   number >= 1 && number <= 9 else {

                 return nil // 숫자가 아니거나 1-9 범위 밖

             }

             if uniqueNumbers.contains(number) {

                 return nil // 중복된 숫자

             }

             uniqueNumbers.insert(number)

             guessNumbers.append(number)

         }

         return guessNumbers

     }



     // 스트라이크/볼 계산

     private func checkGuess(_ guess: [Int]) -> (strikes: Int, balls: Int) {

         var strikes = 0

         var balls = 0



         for (guessIndex, guessNum) in guess.enumerated() {

             for (answerIndex, answerNum) in answer.enumerated() {

                 if guessNum == answerNum {

                     if guessIndex == answerIndex {

                         strikes += 1 // 위치와 숫자가 모두 같음: 스트라이크

                     } else {

                         balls += 1 // 숫자는 같지만 위치는 다름: 볼

                     }

                 }

             }

         }

         return (strikes, balls)

     }

 } */



import Foundation

class BaseballGame {
    private var answer: [Int] = []
    
    // MARK: - 게임 전체 실행 (메뉴 및 흐름 제어)
    func runGame() {
        var gmaeEnd = false
            
        while !gmaeEnd {
            print("환영합니다! 원하시는 번호를 입력해주세요.")
            print("1. 게임 시작하기")
            print("2. 게임 기록 보기")
            print("3. 종료하기")
            print(">> ", terminator: "")
                
            guard let input = readLine(), let selectedNumber = Int(input)
            else {
                print("⚠️ 잘못된 입력입니다. 1, 2, 3 중 하나를 입력해주세요.\n")
                continue
            }
                
            switch selectedNumber {
            case 1:
                print("\n< 게임을 시작합니다 >")
                self.start()
                print("게임이 종료되었습니다. 메뉴로 돌아갑니다.\n")
                    
            case 2:
                print("\n< 게임 기록 보기 >")
                self.showGameRecords()
                print("")
                    
            case 3:
                print("\n< 게임을 종료합니다 >")
                gmaeEnd = true
                    
            default:
                print("⚠️ 올바른 번호를 입력해주세요 (1, 2, 3)\n")
            }
        }
        print("프로그램이 종료되었습니다.")
    }
        
    // MARK: - 단일 숫자 야구 게임 시작 로직
    private func start() {
        answer = makeAnswer()
            
        var attempts = 0
        var isGameEnd = false
            
        while !isGameEnd {
            attempts += 1
            print("\n\(attempts)번째 시도:")
            print("세 자리 숫자를 입력하세요 (예: 123): ", terminator: "")
                
            guard let input = readLine(),
                  let playerGuess = validateInput(input) else {
                print("⚠️ 올바른 세 자리 숫자를 입력해주세요. (중복 불가, 1-9 사이)")
                continue
            }
                
            let (strikes, balls) = checkGuess(playerGuess)
                
            if strikes == 3 {
                print("🎉 축하합니다! 정답을 맞히셨습니다: \(answer.map { String($0) }.joined())")
                print("총 \(attempts)번 만에 맞히셨습니다!")
                isGameEnd = true
            } else {
                // nothing 조건 없이 스트라이크와 볼만 출력
                print("결과: \(strikes) 스트라이크, \(balls) 볼")
            }
        }
    }
        
    // 난수 생성
    private func makeAnswer() -> [Int] {
        var numbers = Array(1...9)
        numbers.shuffle()
        return Array(numbers.prefix(3))
    }
        
    // 사용자 입력 유효성 검사
    private func validateInput(_ input: String) -> [Int]? {
        guard input.count == 3 else {
            return nil
        }
            
        var uniqueNumbers = Set<Int>()
        var guessNumbers: [Int] = []
            
        for char in input {
            guard let number = Int(String(char)),
                  number >= 1 && number <= 9 else {
                return nil
            }
            if uniqueNumbers.contains(number) {
                return nil
            }
            uniqueNumbers.insert(number)
            guessNumbers.append(number)
        }
        return guessNumbers
    }
        
    // 스트라이크/볼 계산
    private func checkGuess(_ guess: [Int]) -> (strikes: Int, balls: Int) {
        var strikeCount = 0
        var ballCount = 0
            
        for i in 0..<3 {
            if self.answer[i] == guess[i] {
                strikeCount += 1
            } else if self.answer.contains(guess[i]){
                ballCount += 1
            }
           
        }
        
        return (strikes: strikeCount, balls: ballCount)
    }
        
    //  게임 기록 보기
    private func showGameRecords() {
        print("아직 저장된 게임 기록이 없습니다.")
        print("이 기능은 나중에 추가될 예정입니다.")
    }
}

