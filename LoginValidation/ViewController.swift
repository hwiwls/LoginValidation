//
//  ViewController.swift
//  LoginValidation
//
//  Created by hwijinjeong on 2/23/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    let viewModel = NicknameViewModel()
    
    var nicknameTextField = UITextField().then {
        $0.backgroundColor = .white
        $0.textColor = .black
        $0.placeholder = "닉네임을 입력해주세요"
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
    }
    
    var validationLabel = UILabel().then {
        $0.textColor = .red
        $0.text = ""
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .right
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configView()
        configHierarchy()
        configLayout()
    }
    
    func configView() {
        viewModel.outputResult.bind { value in
            self.validationLabel.text = value
        }
        
        nicknameTextField.addTarget(self, action: #selector(nicknameTextFieldChanged), for: .editingChanged)
        nicknameTextField.layer.cornerRadius = 10
        nicknameTextField.layer.borderWidth = 1
//        nicknameTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @objc func nicknameTextFieldChanged() {
        viewModel.inputText.text = nicknameTextField.text ?? ""
    }
    
    func configHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(validationLabel)
    }

    func configLayout() {
        nicknameTextField.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(45)
        }
        
        validationLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(8)
            $0.height.equalTo(20)
        }
        
    }

}

