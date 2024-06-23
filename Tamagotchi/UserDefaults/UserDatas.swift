//
//  UserDatas.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/23/24.
//

import UIKit

struct UserDatas {
    
    static var name: String? {
           get {
               return UserDefaults.standard.string(forKey: "nickname")
           }
           set {
               UserDefaults.standard.setValue(newValue, forKey: "nickname")
           }
       }
    
    static func userNameSave(value: String) {
        UserDefaults.standard.set(value, forKey: "nickname")
    }
    
    static func resetData() {
        UserDefaults.standard.setValue("대장", forKey: "nickname")
    }
    
}
