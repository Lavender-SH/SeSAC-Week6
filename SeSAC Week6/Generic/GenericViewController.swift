//
//  GenericViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

        let sampelLabel = UILabel()
        let sampleButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "네비게이션 타이틀"
        view.backgroundColor = .brown
        
        view.addSubview(sampelLabel)
        sampelLabel.backgroundColor = .yellow
        configureBorder(view: sampelLabel)
        sampelLabel.text = "제네릭 테스트"
        sampelLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
//
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampelLabel.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        
//        let generic = sum(a: 3.344, b: 4.77)
//        let generic2 = sum(a: 22, b: 88)
//        
//        let value = sumInt(a: 3, b: 7)
//        print(value)
//        
//        let value2 = sumDouble(a: 3.5, b: 7.7)
//        print(value2)
        
        
    }
    


    

}
