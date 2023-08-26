//
//  AssignmentViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/22.
//

import UIKit

class AssignmentViewController: UIViewController {
    
    
    let grayView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let whiteView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let ummTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        
        
        
        
        return view
    }()
    
    let dateTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(grayView)
        view.addSubview(ummTextField)
        view.addSubview(dateTextField)
        view.addSubview(whiteView)
        setConstraints()
    }
    
    func setConstraints() {
        grayView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leadingMargin.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(200)
        }
        
        ummTextField.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(ummTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
            

        whiteView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(300)
        }
    }
}
