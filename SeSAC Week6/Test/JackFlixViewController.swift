//
//  JackFlixViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/26.
//

import UIKit
import SnapKit

class JackFlixViewController: UIViewController {
    
    
    let titleLabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "JACKFLIX"
        return label
    }()
    
    let emailTextField = {
        let textField = GrayTextField()
        textField.placeholder = "이메일 주소 또는 전화번호"
        return textField
    }()
    
    let passwordTextField = {
        let textField = GrayTextField()
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    let nicknameTextField = {
        let textField = GrayTextField()
        textField.placeholder = "닉네임"
        return textField
    }()
    
    let locationTextField = {
        let textField = GrayTextField()
        textField.placeholder = "위치"
        return textField
    }()
    
    let recommendationTextField = {
        let textField = GrayTextField()
        textField.placeholder = "추천 코드 입력"
        return textField
    }()
    
    let signUpTextField = {
        let textField = GrayTextField()
        textField.placeholder = "회원가입"
        textField.backgroundColor = .white
        return textField
    }()
    
    let switchButton = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .red
        return switchButton
    }()
    
    let extraLabel = {
        let extraLabel = UILabel()
        extraLabel.text = "추가 정보 입력"
        extraLabel.textColor = .white
        extraLabel.font = UIFont.systemFont(ofSize: 15)
        extraLabel.textAlignment = .center
        return extraLabel
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(locationTextField)
        view.addSubview(recommendationTextField)
        view.addSubview(signUpTextField)
        view.addSubview(switchButton)
        view.addSubview(extraLabel)
        
        jackConstraints()
        emailConstriants()
        passwordConstriants()
        nicknameConstriants()
        locationConstriants()
        recommendationConstriants()
        signUpConstraints()
        switchButtonConstraints()
        extraLabelConstraints()
        
    }
    
    func jackConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(100)
            make.leading.equalTo(view).offset(50)
            make.trailing.equalTo(view).offset(-50)
            make.height.equalTo(50)
            make.centerX.equalTo(view)
        }
    }
    func emailConstriants() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(200)
            make.leadingMargin.equalTo(view).offset(30)
            make.trailingMargin.equalTo(view).offset(-30)
            make.height.equalTo(40)
        }
    }
    func passwordConstriants() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    func nicknameConstriants() {
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    func locationConstriants() {
        locationTextField.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    func recommendationConstriants() {
        recommendationTextField.snp.makeConstraints { make in
            make.top.equalTo(locationTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    func signUpConstraints() {
        signUpTextField.snp.makeConstraints { make in
            make.top.equalTo(recommendationTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
        
    }
    func switchButtonConstraints() {
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(signUpTextField.snp.bottom).offset(10)
            make.trailingMargin.equalTo(-30)
            make.height.equalTo(40)
        }
    }
    
    func extraLabelConstraints() {
        extraLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpTextField.snp.bottom).offset(10)
            make.leadingMargin.equalTo(30)
            make.height.equalTo(20)
            
        }
    }
    
    
}
