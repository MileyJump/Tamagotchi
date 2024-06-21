//
//  DetailPopupView.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/21/24.
//

import UIKit

class DetailPopupView: UIView {
    
    private let tamagotchiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let contentsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.layer.borderColor = UIColor.black.cgColor
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

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = .blue
    }
    
    
    private func configureHierarchy() {
        addSubview(tamagotchiImageView)
        addSubview(contentsView)
        addSubview(tamagotchiNameLabel)
    }
    
    private func configureLayout() {
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalToSuperview().multipliedBy(0.3)
            make.width.equalTo(tamagotchiImageView.snp.height)
        }
    }
    
}
