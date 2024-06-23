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
    
    private let isEnabledLabel: UILabel = {
        let label = UILabel()
        label.text = "2글자 이상 6글자 이하까지 가능합니다."
        label.font = .systemFont(ofSize: 13)
        label.textColor = .red
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierarchy()
        configureLayout()
       
        
    }
    
    
    func configureView() {
        view.backgroundColor = .customBackgroundColor
        
        nicknameTextField.delegate = self
        if let nickname = UserDefaults.standard.string(forKey: "nickname") {
            nicknameTextField.text = nickname
        }

        navigationItem.title = "대장님 이름 정하기"
        let save = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = save
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    
    @objc func saveButtonTapped() {
        
        if let nickname = nicknameTextField.text {
            UserDefaults.standard.set(nickname, forKey: "nickname")
            print("저장 됨")
        } else {
            print ("저장 안됨")
        }
        navigationController?.popViewController(animated: true)
    }
    
    func configureHierarchy() {
        view.addSubview(nicknameTextField)
        view.addSubview(lineView)
        view.addSubview(isEnabledLabel)
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
        
        isEnabledLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.leading.equalTo(nicknameTextField.snp.leading)
        }
    }
}

extension NameChangeViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if text.count <= 2 || text.count >= 6 {
            // 길이가 2자 미만이거나 6자 이상일 때 네비게이션 바의 오른쪽 버튼을 막음
            navigationItem.rightBarButtonItem?.isEnabled = false
            isEnabledLabel.text = "2글자 이상 6글자 이하까지 가능합니다."
            isEnabledLabel.textColor = .red
        } else {
            // 그 외의 경우는 버튼을 활성화
            navigationItem.rightBarButtonItem?.isEnabled = true
            isEnabledLabel.text = "사용 가능합니다."
            isEnabledLabel.textColor = .customFontColor
        }
    }
    
    
}
