//
//  NameChangeViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/22/24.
//

import UIKit

class NameChangeViewController: UIViewController {
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "대장님의 이름을 정해주세요!"
        textField.textColor = .customFontColor
        textField.font = .boldSystemFont(ofSize: 13)
        return textField
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .customFontColor
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierarchy()
        configureLayout()
    }
    
    
    func configureView() {
        view.backgroundColor = .customBackgroundColor
        
        navigationItem.title = "대장님 이름 정하기"
        let save = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = save
    }
    
    @objc func saveButtonTapped() {
        
        if let nickname = nicknameTextField.text {
            UserDefaults.standard.set(nickname, forKey: "nickname")
            print("저장 됨")
        } else {
            print ("저장 안됨")
        }
    }
    
    func configureHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(lineView)
    }
    
    func configureLayout() {
        nicknameTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.height.equalTo(40)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom)
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(nicknameTextField)
        }
    }
    
}
