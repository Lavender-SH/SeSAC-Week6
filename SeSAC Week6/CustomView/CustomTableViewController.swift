//
//  CustomTableViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/24.
//
import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {

    //viewDidLoad보다 클로저 구문이 먼저 실행이 됨
    //CustomeTableViewController 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self //자기 자신의 인스턴스
        view.dataSource = self
        //uinib - xib
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return view
    }()
    let imageView = {
        let view = PosterImageView(frame: .zero)//UIImageView()
//        view.backgroundColor = .yellow
//        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 2
//        view.clipsToBounds = true
//        view.layer.cornerRadius = 10
        return view
    }()
   // var isExpand = false // false 2줄, true 0 무한대
    
    var list = [Sample(text: "텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트텍스트", isExpand: false), Sample(text: "ffff", isExpand: false), Sample(text: "xxxxx", isExpand: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        //self.view.backgroundColor
//        tableView.delegate = self //자기 자신의 인스턴스
//        tableView.dataSource = self
//        //uinib - xib
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
}

extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.label.text = list[indexPath.row].text
        cell.label.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
//        tableView.reloadData()
        //IndexPath(row:3, section: 0)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
    
}
