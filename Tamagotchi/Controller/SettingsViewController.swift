//
//  SettingsViewController.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/22/24.
//

import UIKit


class SettingsViewController: UIViewController {
    
    var nickname = ""
    var delegate: NicknameChange?
    
    var list = SettingsList().list
    
    let settingTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.backgroundColor = .clear
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let name = UserDatas.name else { return }
        
        list[0].nameLabel = name
        settingTableView.reloadData()
    }
    
    private func configureView() {
        view.backgroundColor = .customBackgroundColor
        
        navigationItem.title = "설정"
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
    
    func configureHierarchy() {
        view.addSubview(settingTableView)
    }
    
    func configureLayout() {
        settingTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        cell.configureCell(list[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let settingLabel = SettingOptions.allCases[indexPath.row]
        
        switch settingLabel {
        case .nameSetting:
            let vc = NameChangeViewController()
            navigationController?.pushViewController(vc, animated: true)
        case .tamagotchiChange:
            changeBegin()
        case .dataReset:
            configureAlret()
        }
        
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
        
    }
    
    func configureAlret() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
        let open = UIAlertAction(title: "웅", style: .default) { action in
            self.tamagotchiBegin()
        }
        let cancel = UIAlertAction(title: "아냐!", style: .cancel)
        
        alert.addAction(cancel)
        alert.addAction(open)
        
        present(alert, animated: true)
    }
    
    func changeBegin() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let rootViewController = ViewController()
        rootViewController.type = .change
        let navigationController = UINavigationController(rootViewController: rootViewController)
        sceneDelegate?.window?.rootViewController = navigationController
        sceneDelegate?.window?.makeKeyAndVisible()
        
    }
    
    func tamagotchiBegin() {
        let defaults = UserDefaults.standard
        if let appDomain = Bundle.main.bundleIdentifier {
            defaults.removePersistentDomain(forName: appDomain)
            defaults.synchronize()
        }
        
        UserDatas.resetData()
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        let rootViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        sceneDelegate?.window?.rootViewController = navigationController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}

