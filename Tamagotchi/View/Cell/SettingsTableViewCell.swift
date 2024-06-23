//
//  SettingsTableViewCell.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/22/24.
//

import UIKit

protocol NicknameChange {
    func nicknameSave(nickname: String)
}

class SettingsTableViewCell: UITableViewCell, NicknameChange {
    func nicknameSave(nickname: String) {
        self.nickname = nickname
        print("아니 뭐지.. ")
    }
    
    
    
    
    var nickname = "고래밥" {
        didSet {
            print("ㅎㅎ")
        }
    }
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .customFontColor
        return imageView
    }()
    
    let settingsTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "내 이름 설정하기"
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "고래밥"
        label.textColor = .customFontColor
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.compact.right")
        imageView.tintColor = .lightGray
        return imageView
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(_ data: SettingsModel ) {
        settingsTitleLabel.text = data.settingTitle.title
        iconImageView.image = UIImage(systemName: data.settingTitle.iconImageName)
    }
    
    func configureView() {
        self.backgroundColor = .clear
    }
    
    
    
    func configureHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(settingsTitleLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(arrowImageView)
    }
    
    func configureLayout() {
        iconImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(20)
            make.width.equalTo(20)
            make.height.equalTo(30)
            make.verticalEdges.equalTo(contentView).inset(15)
        }
        
        settingsTitleLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(15)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).inset(20)
            make.verticalEdges.equalTo(iconImageView)
            make.height.equalTo(20)
            make.width.equalTo(15)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.trailing.equalTo(arrowImageView.snp.leading).inset(-5)
            make.verticalEdges.equalTo(iconImageView)
        }
    }

}
