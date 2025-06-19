//
//  ContentView.swift
//  계산기
//
//  Created by 송명균 on 5/30/25.
//

import SwiftUI

struct CalculatorView: View {
    
    @State private var display = "0"
    @State private var currentOperation: OperationType? = nil
    @State private var firstOperand: Double? = nil
    @State private var userIsTyping = false
    @State private var pressedButton: CalculatorButton? = nil
    
    let buttons: [[CalculatorButton]] = [
        [.function("AC"), .function("±"), .function("%"), .operation("÷")],
        [.digit("7"), .digit("8"), .digit("9"), .operation("×")],
        [.digit("4"), .digit("5"), .digit("6"), .operation("-")],
        [.digit("1"), .digit("2"), .digit("3"), .operation("+")],
        [.function(""), .digit("0"), .function("."), .operation("=")]
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(display)
                    .font(.system(size: 48, weight: .medium, design: .rounded))
                    .foregroundColor(Color(hex: "FFBCB3"))
                    .padding()
            }
            
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            pressedButton = button
                            handleButtonPress(button)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                pressedButton = nil
                            }
                        }) {
                            Text(button.title)
                                .font(.system(size: 32, weight: .medium, design: .rounded))
                                .frame(width: 90, height: 90)
                                .background(button.backgroundColor)
                                .foregroundColor(Color(hex: "FFBCB3"))
                                .clipShape(Circle())
                                .shadow(color: .gray.opacity(0.25), radius: 3, x: 2, y: 2)
                                .scaleEffect(pressedButton == button ? 0.9 : 1.0)
                                .animation(.spring(response: 0.3, dampingFraction: 0.5), value: pressedButton == button)
                        }
                    }
                }
                .padding(.bottom, 8)
            }
        }
        .padding()
        .background(Color(hex: "F5F5F5"))
    }
    
    func handleButtonPress(_ button: CalculatorButton) {
        switch button {
        case .digit(let number):
            if userIsTyping {
                if display == "0" && number != "." {
                    display = number
                } else if number == "." && display.contains(".") {
                    break
                } else {
                    display += number
                }
            } else {
                display = (number == ".") ? "0." : number
                userIsTyping = true
            }
        case .operation(let op):
            if op == "=" {
                guard let operation = currentOperation,
                      let first = firstOperand,
                      let second = Double(display) else { return }
                display = formatResult(applyOperation(first: first, second: second, operation: operation))
                userIsTyping = false
                currentOperation = nil
                firstOperand = nil
            } else if let operationType = OperationType(rawValue: op) {
                currentOperation = operationType
                firstOperand = Double(display)
                userIsTyping = false
            }
        case .function(let fn):
            switch fn {
            case "AC":
                display = "0"
                currentOperation = nil
                firstOperand = nil
                userIsTyping = false
            case "±":
                if let val = Double(display) {
                    display = formatResult(-val)
                }
            case "%":
                if let val = Double(display) {
                    display = formatResult(val / 100)
                }
            default:
                break
            }
        }
    }
    
    func applyOperation(first: Double, second: Double, operation: OperationType) -> Double {
        switch operation {
        case .add: return first + second
        case .subtract: return first - second
        case .multiply: return first * second
        case .divide: return second != 0 ? first / second : 0
        }
    }
    
    func formatResult(_ value: Double) -> String {
        return value.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(value)) : String(value)
    }
}

enum CalculatorButton: Hashable {
    case digit(String)
    case operation(String)
    case function(String)
    
    var title: String {
        switch self {
        case .digit(let value), .operation(let value), .function(let value):
            return value
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .digit:
            return Color(hex: "FFD8B1") // 파스텔 오렌지
        case .operation:
            return Color(hex: "FFD1DC") // 파스텔 핑크
        case .function:
            if title == "." || title == "" {
                return Color(hex: "B0EACD") // 파스텔 그린
            } else {
                return Color(hex: "AEC6CF") // 파스텔 블루
            }
        }
    }
}

enum OperationType: String {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
}

// HEX 코드로 Color 만드는 확장
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
