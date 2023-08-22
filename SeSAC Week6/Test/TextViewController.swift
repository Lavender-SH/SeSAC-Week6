//
//  TextViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemMint
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(photoImageView)
        view.addSubview(titleTextField)
        
        let uiSet = [photoImageView, titleTextField]
        uiSet.forEach {view.addSubview($0)}
        
        setConstraints()
        //top, leading, trailing은 0으로 맞추기, 높이는 200
        
        
    }
    
    func setConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
    }
}
