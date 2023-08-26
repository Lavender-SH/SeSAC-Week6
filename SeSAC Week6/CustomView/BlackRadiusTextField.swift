//
//  BlackRadiusTextField.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/24.
//

import UIKit

class BlackRadiusTextField: UITextField {
    
    //코드베이스
    //Interface Builder를 사용하지 않고, UIView를 상속 받은 Custom Class를 코드로 구성할 때 사용되는 초기화 구문
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }

    //스토리보드
    //NSCoding
    //XIB -> NIB변환 과정에서 객체 생성 시 필요한 init 구문(story board)
    //Interface Builder에서 생성된 뷰들이 초기화될 때 실행되는 구문!
    required init?(coder: NSCoder) { //NSCoding
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView() {
        borderStyle = .none
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        textColor = .black
        textAlignment = .center
        font = .boldSystemFont(ofSize: 15)
    
        
    }
    
}


class Test {
    var frame: CGRect
    var y: Int
    
    init(frame: CGRect, y: Int) {
        self.frame = frame
        self.y = y
    }
}

class Sub: Test {
    override init(frame: CGRect, y: Int) {
        super.init(frame: frame, y: y)
    }
}





protocol ExampleProtocol {
    init(name: String)
}
class Mobile: ExampleProtocol {
    // required: 프로토콜에서 생성된 경우 사용하는 키워드
    // required Initializer (필수 생성자)
    required init(name: String) {
        print(123)
    }
    
    
}
