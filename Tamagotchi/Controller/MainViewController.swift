//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/21/24.
//

import UIKit
import TextFieldEffects

class MainViewController: UIViewController {
    
    // MARK: - 프로퍼티
    var tamagotchiModel: TamagotchiModel?
    
    var tamagotchiImage: String = "" {
        didSet {
            statusImage()
        }
    }
    
    var tamagotchiName: String = "" {
        didSet {
            statusName()
        }
    }
    
    var levelCount = 1 {
        didSet {
            print("levelCount")
            imageStatus()
        }
    }
    
    var eatCount = 0 {
        didSet {
            print("eatCount")
            levelStatus()
            foodStatus()
        }
    }
    
    var waterCount = 0 {
        didSet {
            print("waterCount")
            levelStatus()
            foodStatus()
        }
    }
    
    
    private let bubbleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bubble")
        return imageView
    }()
    
    private lazy var bubbleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15)
        label.textColor = .customFontColor
        label.text = Bubble.randomMessage()
        return label
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
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .customFontColor
        label.font = .boldSystemFont(ofSize: 13)
        label.text = "LV1 · 밥알 0개 · 물방울 0개"
        return label
    }()
    
    private let eatTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 13)
        textField.placeholder = "밥주세용"
        textField.textColor = .customFontColor
        textField.textAlignment = .center
        return textField
    }()
    
    private let waterTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 13)
        textField.placeholder = "물주세용"
        textField.textColor = .customFontColor
        textField.textAlignment = .center
        return textField
    }()
    
    private let eatLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .customFontColor
        return view
    }()
    
    private let waterLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .customFontColor
        return view
    }()
    
    private lazy var eatButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        button.setTitle("밥먹기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.layer.borderColor = UIColor.customFontColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.setTitleColor(.customFontColor, for: .normal)
        button.addTarget(self, action: #selector(eatButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var waterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        button.setTitleColor(.customFontColor, for: .normal)
        button.setTitle("물먹기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.layer.borderColor = UIColor.customFontColor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(waterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    private func foodStatus() {
        statusLabel.text = "LV\(levelCount) · 밥알 \(eatCount)개 · 물방울 \(waterCount)개"
    }
    
    private func levelStatus() {
        let level = (eatCount / 5) + (waterCount / 2)
        switch level {
        case 0...9 :
            levelCount = 1
        case 10...19 :
            levelCount = 1
        case 20...29 :
            levelCount = 2
        case 30...39 :
            levelCount = 3
        case 40...49 :
            levelCount = 4
        case 50...59 :
            levelCount = 5
        case 60...69 :
            levelCount = 6
        case 70...79 :
            levelCount = 7
        case 80...89 :
            levelCount = 8
        case 90...99 :
            levelCount = 9
        case 100... :
            levelCount = 20
        default:
            print(#function, "default")
        }
    }
    
    private func imageStatus() {
        let imageMapping: [String: [String]] = [
            "따끔따끔 다마고치": ["1-1", "1-2", "1-3", "1-4", "1-5", "1-6", "1-7", "1-8", "1-9"],
            "방실방실 다마고치": ["2-1", "2-2", "2-3", "2-4", "2-5", "2-6", "2-7", "2-8", "2-9"],
            "반짝반짝 다마고치": ["3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8", "3-9"]
        ]
        
        if let imageArray = imageMapping[tamagotchiName] {
            let imageIndex = min(levelCount - 1, imageMapping.count - 1)
            tamagotchiImage = imageArray[imageIndex]
        }
        
    }
    
    
    private func statusImage() {
        tamagotchiImageView.image = UIImage(named: tamagotchiImage)
    }
    
    private func statusName() {
        tamagotchiNameLabel.text = tamagotchiName
    }
    
    @objc func eatButtonTapped() {
        guard let text = eatTextField.text else { return }
        if text.isEmpty {
            eatCount += 1
        } else if let eatText = Int(text), eatText <= 99  {
            eatCount += eatText
            eatTextField.text = ""
        }
        bubbleLabel.text = Bubble.randomMessage()
    }
    
    @objc func waterButtonTapped() {
        guard let text = waterTextField.text else { return }
        if text.isEmpty {
            waterCount += 1
        } else if let waterText = Int(text), waterText <= 99  {
            waterCount += waterText
            waterTextField.text = ""
        }
        bubbleLabel.text = Bubble.randomMessage()
    }
    
    @objc func settingsButtonTapped() {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureView() {
        view.backgroundColor = .customBackgroundColor
        navigationItem.title = "대장님의 다마고치"
        
        let settings = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settings
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .customFontColor
    }
    
    private func configureHierarchy() {
        view.addSubview(bubbleImageView)
        view.addSubview(bubbleLabel)
        view.addSubview(tamagotchiImageView)
        view.addSubview(contentsView)
        view.addSubview(tamagotchiNameLabel)
        view.addSubview(statusLabel)
        view.addSubview(eatTextField)
        view.addSubview(waterTextField)
        view.addSubview(eatLineView)
        view.addSubview(waterLineView)
        view.addSubview(eatButton)
        view.addSubview(waterButton)
    }
    
    private func configureLayout() {
        bubbleImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(75)
            make.height.equalTo(view.snp.width).multipliedBy(0.4)
        }
        
        bubbleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(bubbleImageView).offset(-10)
            make.horizontalEdges.equalTo(bubbleImageView).inset(10)
        }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(bubbleImageView).inset(20)
            make.height.equalTo(tamagotchiImageView.snp.width)
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
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(contentsView.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        eatTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(30)
            make.leading.equalTo(bubbleImageView.snp.leading).inset(-10)
            make.height.equalTo(30)
            make.width.equalTo(view.snp.width).multipliedBy(0.40)
        }
        
        eatLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(eatTextField)
            make.top.equalTo(eatTextField.snp.bottom)
        }
        eatButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(eatTextField)
            make.leading.equalTo(eatTextField.snp.trailing).offset(5)
            make.width.equalTo(65)
            
        }
        
        waterTextField.snp.makeConstraints { make in
            make.top.equalTo(eatTextField.snp.bottom).offset(30)
            make.leading.equalTo(bubbleImageView.snp.leading).inset(-10)
            make.height.equalTo(30)
            make.width.equalTo(view.snp.width).multipliedBy(0.40)
        }
        
        waterLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(waterTextField)
            make.top.equalTo(waterTextField.snp.bottom)
        }
        waterButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(waterTextField)
            make.leading.equalTo(waterTextField.snp.trailing).offset(5)
            make.width.equalTo(eatButton)
            
        }
        
    }
    
}
