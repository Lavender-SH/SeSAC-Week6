//
//  TextViewController.swift
//  SeSAC Week6
//
//  Created by 이승현 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {
    
    //1.
    let picker = UIImagePickerController()
    
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
    
    
    //읽기 권한은 필요없음 수정삭제는 권한 필요
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //2. available
//        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
//            print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
//            return
//        }
//        picker.delegate = self
//        picker.sourceType = .camera //.photoLibrary
//        picker.allowsEditing = true
        
        //let picker = UIFontPickerViewController()
        let picker2 = UIColorPickerViewController()
        present(picker2, animated: true)
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
extension TextViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
        print(#function)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {   //.originalImage]
            self.photoImageView.image = image
            dismiss(animated: true)
        }
    }
    
}
