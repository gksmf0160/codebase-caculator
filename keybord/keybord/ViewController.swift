//
//  ViewController.swift
//  keybord
//
//  Created by 송명균 on 7/10/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let textField = UITextField()
    let button = UIButton(type: .system)
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트 필드 추가
        view.addSubview(textField)
        textField.borderStyle = .line
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 주소"
        textField.backgroundColor = .red
        textField.delegate = self
        textField.becomeFirstResponder()
        
        // 버튼 추가
        view.addSubview(button)
        button.setTitle("등록", for: .normal)
        
        // 레이블 추가
        view.addSubview(label)
        label.text = "여기에 출력됩니다"
        label.textColor = .black
        
        // 레이아웃 설정
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(button.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        // 버튼 액션 연결
        button.addTarget(self, action: #selector(printLog), for: .touchUpInside)
    }
    
    @objc func printLog() {
        label.text = textField.text
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")를 검색했습니다.")
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("\(textField.text ?? "")로 값이 바뀌었습니다.")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트 필드의 입력을 시작했다.")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("유저가 텍스트 필드의 입력을 종료했다.")
    }
}

