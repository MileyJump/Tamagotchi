//
//  SettingsViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/22/24.
//

import UIKit

enum SettingOptions: String, CaseIterable {
    case nameSetting = "내 이름 설정하기"
    case tamagotchiChange = "다마고치 변경하기"
    case dataReset = "데이터 초기화"
}

class SettingsViewController: UIViewController {
    
    
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.backgroundColor = .blue
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureHierarchy()
        configureLayout()
    }
    
    private func configureView() {
        view.backgroundColor = .customBackgroundColor
        
        navigationItem.title = "설정"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SettingOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingLabel = SettingOptions.allCases[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        cell.settingsTitleLabel.text = settingLabel.rawValue
        
        switch settingLabel {
        case .nameSetting:
            cell.iconImageView.image = UIImage(systemName: "pencil")
        case .tamagotchiChange:
            cell.iconImageView.image = UIImage(systemName: "moon.fill")
            cell.nameLabel.isHidden = true
        case .dataReset:
            cell.iconImageView.image = UIImage(systemName: "arrow.clockwise")
            cell.nameLabel.isHidden = true
        }
        
        return cell
    }
    
   
}

