//
//  CustomViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/24.
//

import UIKit
import SnapKit

class CustomViewController: UIViewController {
    
    let idTextField = {
        let view = BlackRadiusTextField()
        //BlackRadiusTextField(frame: CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>))
       // view.setupView()
        view.placeholder = "아이디를 입력해주세요"
        
        return view
    }()
    
    let passwordTextField = {
        let view = BlackRadiusTextField()
        view.setupView()
        view.placeholder = "비밀번호를 입력해주세요"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(idTextField)
        idTextField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.center.equalToSuperview().offset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        
        
    }
    

    
    
    

}
