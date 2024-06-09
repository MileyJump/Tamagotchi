//
//  TamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/8/24.
//

import UIKit
import SnapKit

class TamagotchiCollectionViewCell: UICollectionViewCell {
    
    let tamagotchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = . blue
        return imageView
    }()
    
    let contentsLabel: UILabel = {
        let label = UILabel()
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
    
    func configureHierarchy() {
        contentView.addSubview(tamagotchImageView)
        contentView.addSubview(contentsLabel)
    }
    
    func configureLayout() {
        tamagotchImageView.snp.makeConstraints { make in
            
        }
    }
    
    
}
