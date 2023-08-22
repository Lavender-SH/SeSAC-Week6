//
//  SnapViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/22.
//

import UIKit
import SnapKit
/*
 addSubView
 superView
 offset inset
 RTL: leading vs left
 */

//class SnapViewController: UIViewController {
//
//    let redView = UIView()
//    let whiteView = UIView()
//    let blueView = UIView()
//    let yellowView = UIView()
//
//    //디바이스 정중앙에 위치, width heihgt 200
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        view.backgroundColor = .lightGray
//
//        view.addSubview(redView)
//        redView.backgroundColor = .red
//        redView.snp.makeConstraints { make in
//            make.width.equalTo(200)
//            make.height.equalTo(150)
//            make.centerX.equalTo(view)
//            //make.bottom.equalTo(view)
//            make.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//
//
//        view.addSubview(whiteView)
//        whiteView.backgroundColor = .white
//        whiteView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.equalTo(view.safeAreaLayoutGuide)
//            make.trailing.equalTo(view.safeAreaLayoutGuide)
//            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            make.height.equalTo(200)
//        }
//
//        view.addSubview(blueView)
//        blueView.backgroundColor = .blue
//        blueView.snp.makeConstraints { make in
////            make.width.height.equalTo(200)
//            make.size.equalTo(200)
////            make.centerX.centerY.equalTo(view)
//            make.center.equalTo(view)
//
//        }
//        blueView.addSubview(yellowView)
//        yellowView.backgroundColor = .yellow
//        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
//            make.leading.top.equalToSuperview()
//            //make.leading.top.trailing.bottom.equalToSuperview()
//            make.edges.equalTo(blueView).inset(50)
//
//            make.leading.top.equalTo(blueView).offset(-50)
//        }
//    }
    
    class SnapKitViewController: UIViewController {
      let redView = UIView()
      let whiteView = UIView()
      let blueView = UIView()
      let yellowView = UIView()
      override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        // addSubView 순서대로 View에 올라가기 때문에 layout 겹치면 안보일 수도 있으니 확인 :별:️
        view.addSubview(redView)
        redView.backgroundColor = .systemRed
        redView.snp.makeConstraints { make in
          make.width.equalTo(200)
          make.height.equalTo(150)
          make.centerX.equalTo(view)
          make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
          make.top.equalTo(view.safeAreaLayoutGuide)
            
          make.horizontalEdges.equalTo(view.safeAreaLayoutGuide) // == make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
          //make.verticalEdges.equalTo(view.safeAreaLayoutGuide) // == make.top.bottom.equalTo(view.safeAreaLayoutGuide)
          make.height.equalTo(200)
        }
        view.addSubview(blueView)
        blueView.backgroundColor = .systemBlue
        blueView.snp.makeConstraints { make in
    //    make.width.height.equalTo(200) // width, height 값이 같다면 한줄 작성 가능
          make.size.equalTo(200) // == make.width.height.equalTo(200)
          make.center.equalTo(view) // == make.centerX.centerY.equalTo(view)
        }
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .systemYellow
        yellowView.snp.makeConstraints { make in
    //      make.size.equalTo(150)
    //      make.center.equalToSuperview() // equalToSuperview 내가 속한 상위 view를 기준으로 레이아웃 설정
    //      make.left.top.equalToSuperview()
          // 상위 뷰 기준으로 완전 같게 만들겠다.
    //      make.edges.equalToSuperview() // == make.leading.trailing.top.bottom.equalToSuperview()
          // inset, offset
            make.edges.equalTo(blueView).inset(50)
    //      make.edges.equalTo(blueView).offset(50)
        }
      }
    }

