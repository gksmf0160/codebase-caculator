import Foundation
//1. 정수 배열의 각 숫자를 문자열로 변환하여 새로운 배열을 만드세요.
let nums: [Int] = [1, 2, 3, 4, 5]
let numStrings: [String] = nums.map(nums in
                                    return String(nums))

//2. 문자열 배열에서 굴자 수가 5개 이하인 단어만 포함하는 새로운 배열을 만드세요.
let words: [String] = ["감자", "고구마", "옥수수", "얌", "카바사"]

//3. 문자열 배열의 모든 단어를 하나의 긴 문자열로 연결하세요.
let longWords: String = words.reduce("") {$0 + $1}

print(longWords)
//4. 정수 배열을 오름차순으로 정렬하세요.
let sortedNums: [Int] = nums.sorted()
print(sortedNums)
//5. 이름 배열의 각 이름 앞에 “안녕하세요, “를 붙여서 콘솔에 출력하세요.
//6. 문자열 배열에서 정수로 변환 가능한 요소만 추출하여 새로운 정수 배열을 만드세요.
//7. 정수 배열에서 가장 먼저 나오는 홀수를 찾으세요.
//8. 과일 이름에 “grape”가 포함되어 있는지 여부를 확인하고 Bool 값으로 출력하세요.
