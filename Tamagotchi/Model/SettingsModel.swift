//
//  SettingsModel.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/23/24.
//

import UIKit

struct SettingsModel {
    let settingTitle: SettingOptions
    var nameLabel: String?
    
}

struct SettingsList {
    let list = [
        SettingsModel(settingTitle: .nameSetting, nameLabel: UserDatas.name),
        SettingsModel(settingTitle: .tamagotchiChange, nameLabel: nil),
        SettingsModel(settingTitle: .dataReset, nameLabel: nil)
    ]
}


enum SettingOptions: String, CaseIterable {
    case nameSetting
    case tamagotchiChange
    case dataReset
    
    var title: String {
        switch self {
        case .nameSetting:
            "내 이름 설정하기"
        case .tamagotchiChange:
            "다마고치 변경하기"
        case .dataReset:
            "데이터 초기화"
        }
        
    }
    
    var iconImageName: String {
        switch self {
        case .nameSetting:
            "pencil"
        case .tamagotchiChange:
            "moon.fill"
        case .dataReset:
            "arrow.clockwise"
        }
    }
}

//
//    case nameSetting = "내 이름 설정하기"
//    case tamagotchiChange = "다마고치 변경하기"
//    case dataReset = "데이터 초기화"

