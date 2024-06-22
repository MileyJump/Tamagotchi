//
//  DetailPopupView.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/21/24.
//

import UIKit

class DetailPopupView: UIView {
    
    var tamagotchiType: TamagotchiType = .select {
        didSet {
            setUpStartButton()
        }
    }

    
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.3)
        return view
    }()
  
    private let popupView: UIView = {
        let view = UIView()
        view.backgroundColor = .customBackgroundColor
        view.layer.cornerRadius = 6
        return view
    }()
    
    private let tamagotchiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let contentsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.borderColor = UIColor.customFontColor.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .clear
        return view
    }()
    
    private let tamagotchiNameLabel: UILabel = {
        let label = UILabel()
        label.text = "따끔따끔 다마고치"
        label.textColor = UIColor(cgColor: CGColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1))
        label.font = .boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .customFontColor
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "저는 방실방실 다마고치입니다. 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!"
        label.textColor = .customFontColor
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let buttonLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .customFontColor.withAlphaComponent(0.3)
        return view
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.customFontColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.backgroundColor = .lightGray.withAlphaComponent(0.2)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.customFontColor, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
//        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpStartButton() {
        switch tamagotchiType {
        case .select:
            startButton.setTitle("시작하기", for: .normal)
        case .change:
            startButton.setTitle("변경하기", for: .normal)
        }
    }
   
    
    func configureCell(_ data: TamagotchiModel) {
        tamagotchiImageView.image = UIImage(named: data.tamagotchiImage)
        tamagotchiNameLabel.text = data.tamagotchiName
    }
    
    @objc func cancelButtonTapped() {
        self.removeFromSuperview()
    }
    
    @objc func startButtonTapped() {
        print(#function)
        
    }
     
    
    private func configureHierarchy() {
        addSubview(backgroundView)
        backgroundView.addSubview(popupView)
        popupView.addSubview(tamagotchiImageView)
        popupView.addSubview(contentsView)
        popupView.addSubview(tamagotchiNameLabel)
        popupView.addSubview(lineView)
        popupView.addSubview(descriptionLabel)
        popupView.addSubview(buttonLineView)
        popupView.addSubview(cancelButton)
        popupView.addSubview(startButton)
    }
    
    private func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popupView.snp.makeConstraints { make in
            make.center.equalTo(backgroundView)
            make.height.equalTo(backgroundView.snp.height).multipliedBy(0.52)
            make.width.equalTo(popupView.snp.height).multipliedBy(0.7)
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.equalTo(popupView.snp.top).inset(50)
            make.centerX.equalTo(popupView)
            make.size.equalTo(125)
        }
        
        tamagotchiNameLabel.snp.makeConstraints { make in
            make.center.equalTo(contentsView)
        }
        
        contentsView.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.leading.equalTo(tamagotchiNameLabel.snp.leading).offset(-6)
            make.trailing.equalTo(tamagotchiNameLabel.snp.trailing).offset(6)
            make.centerX.equalToSuperview()
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(6)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(contentsView.snp.bottom).offset(30)
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(popupView).inset(40)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(lineView)
            make.bottom.equalTo(cancelButton.snp.top).offset(-20)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.width.equalTo(popupView.snp.width).multipliedBy(0.5)
            make.height.equalTo(cancelButton.snp.width).multipliedBy(0.3)
            make.bottom.leading.equalTo(popupView)
        }
        
        startButton.snp.makeConstraints { make in
            make.bottom.size.equalTo(cancelButton)
            make.trailing.equalTo(popupView.snp.trailing)
            
        }
        
        buttonLineView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(popupView)
            make.height.equalTo(1)
            make.bottom.equalTo(startButton.snp.top)
        }
        
        
    }
    
}
