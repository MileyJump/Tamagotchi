//
//  TamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/8/24.
//

import UIKit
import SnapKit

class TamagotchiCollectionViewCell: UICollectionViewCell {
    
    let tamagotchiImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .center
//        imageView.backgroundColor = . blue
        imageView.image = UIImage(named: "1-1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let contentsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .brown
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        tamagotchiImageView.layer.cornerRadius = tamagotchiImageView.frame.height / 2
    }
    
    func configureHierarchy() {
        addSubview(tamagotchiImageView)
        addSubview(contentsLabel)
    }
    
    func configureLayout() {
        contentsLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
                }
        
        tamagotchiImageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(contentsLabel.snp.top).offset(-4)
        }
        
    }
    
    
}
