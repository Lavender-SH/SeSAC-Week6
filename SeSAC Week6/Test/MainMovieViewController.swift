//
//  mainMovieViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/27.
//

import UIKit
import SnapKit

class MainMovieViewController: UIViewController {
    
    let backgroundImageView = {
        let imageView = UIImageView(image: UIImage(named: "어벤져스엔드게임"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let circleImageView = {
        let circleView = UIImageView(image: UIImage(named: "겨울왕국"))
        circleView.contentMode = .scaleAspectFill
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.frame.width / 5
        circleView.layer.borderWidth = 3
        circleView.layer.borderColor = UIColor.gray.cgColor
        return circleView
    }()
    
    let circleTwoImageView = {
        let circleView = UIImageView(image: UIImage(named: "광해"))
        circleView.contentMode = .scaleAspectFill
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.frame.width / 5
        circleView.layer.borderWidth = 3
        circleView.layer.borderColor = UIColor.gray.cgColor
        return circleView
    }()
    
    let circleThirdImageView = {
        let circleView = UIImageView(image: UIImage(named: "아바타"))
        circleView.contentMode = .scaleAspectFill
        circleView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.frame.width / 5
        circleView.layer.borderWidth = 3
        circleView.layer.borderColor = UIColor.gray.cgColor
        return circleView
    }()
    // MARK: - 스택뷰 연습
    lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [circleImageView, circleTwoImageView, circleThirdImageView])
        stview.spacing = 10
        stview.axis = .horizontal
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    let playButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 15, weight: .bold)
        let playImage = UIImage(systemName: "play.fill", withConfiguration: configuration)
        button.setTitle("재생", for: .normal)
        button.setImage(playImage, for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.contentMode = .scaleAspectFill
        button.layer.cornerRadius = 3
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .black
        view.addSubview(backgroundImageView)
        view.addSubview(circleImageView)
        view.addSubview(circleTwoImageView)
        view.addSubview(circleThirdImageView)
        view.addSubview(stackView)
        view.addSubview(playButton)
        
        backgroundImageConstraints()
        //circleImageConstraints()
        //circleTwoImageConstraints()
        //circleThirdImageConstraints()
        stackViewConstraints()
        buttonConstraints()
    }
    
    
    func backgroundImageConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view).offset(-200)
        }
    }
    func circleImageConstraints() {
        circleImageView.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(-20)
            //make.size.equalTo(10)
            make.top.equalTo(backgroundImageView.snp.bottom).offset(10)
            make.size.equalTo(120)
        }
    }
    func circleTwoImageConstraints() {
        circleTwoImageView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(10)
            make.bottom.equalTo(view).offset(-20)
            make.leading.equalTo(circleImageView.snp.trailing).offset(10)
            make.size.equalTo(120)
        }
    }
    func circleThirdImageConstraints() {
        circleThirdImageView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(10)
            make.bottom.equalTo(view).offset(-20)
            make.leading.equalTo(circleTwoImageView.snp.trailing).offset(10)
            make.size.equalTo(120)
        }
    }
    // MARK: - 스택뷰 오토레이아웃 연습
    func stackViewConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(backgroundImageView.snp.bottom).offset(10)
            make.leading.equalTo(view).offset(10)
            make.trailing.equalTo(view).offset(-10)
            make.bottom.equalTo(view).offset(-20)
        }
    }
    func buttonConstraints() {
        playButton.snp.makeConstraints { make in
            make.bottom.equalTo(backgroundImageView.snp.bottom).inset(58)
            make.centerX.equalTo(view)
            make.width.equalTo(120)
        }
    }
    

    
    
    
    
}









