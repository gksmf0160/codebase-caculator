//
//  ContentView.swift
//  codebase-caculator
//
//  Created by 송명균 on 6/23/25.
//


import UIKit

class ViewController: UIViewController {
    
    // MARK: - 수식 표시 라벨
    let displayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        label.text = "12345"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - 뷰 생성
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    // MARK: - 버튼 생성 함수
    func makeButton(title: String, backgroundColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 40
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    // MARK: - 수평 스택뷰 생성 함수
    func makeHorizontalStackView(_ buttons: [UIButton]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    // MARK: - 레이아웃 설정
    func setupLayout() {
        // 1. 라벨 추가
        view.addSubview(displayLabel)
        NSLayoutConstraint.activate([
            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),

            displayLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // 2. 버튼 색상 정의
        let darkGray = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        let pink = UIColor.systemPink.withAlphaComponent(0.4)
        let yellow = UIColor.systemYellow.withAlphaComponent(0.4)
        let green = UIColor.systemGreen.withAlphaComponent(0.4)
        let gray = UIColor.systemGray.withAlphaComponent(0.5)

        // 3. 버튼 묶음들 (가로)
        let row1 = makeHorizontalStackView([
            makeButton(title: "AC", backgroundColor: gray),
            makeButton(title: "±", backgroundColor: gray),
            makeButton(title: "%", backgroundColor: gray),
            makeButton(title: "÷", backgroundColor: pink)
        ])
        
        let row2 = makeHorizontalStackView([
            makeButton(title: "1", backgroundColor: yellow),
            makeButton(title: "2", backgroundColor: yellow),
            makeButton(title: "3", backgroundColor: yellow),
            makeButton(title: "×", backgroundColor: pink)
        ])
        
        let row3 = makeHorizontalStackView([
            makeButton(title: "4", backgroundColor: yellow),
            makeButton(title: "5", backgroundColor: yellow),
            makeButton(title: "6", backgroundColor: yellow),
            makeButton(title: "-", backgroundColor: pink)
        ])
        
        let row4 = makeHorizontalStackView([
            makeButton(title: "7", backgroundColor: yellow),
            makeButton(title: "8", backgroundColor: yellow),
            makeButton(title: "9", backgroundColor: yellow),
            makeButton(title: "+", backgroundColor: pink)
        ])
        
        let row5 = makeHorizontalStackView([
            makeButton(title: "", backgroundColor: green), // 공백 버튼 (왼쪽 아래)
            makeButton(title: "0", backgroundColor: yellow),
            makeButton(title: ".", backgroundColor: green),
            makeButton(title: "=", backgroundColor: pink)
        ])

        // 4. 수직 스택뷰에 모두 담기
        let verticalStackView = UIStackView(arrangedSubviews: [row1, row2, row3, row4, row5])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verticalStackView)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: 60),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
