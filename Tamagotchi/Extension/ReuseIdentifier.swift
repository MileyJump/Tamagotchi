//
//  ReuseExtension.swift
//  Tamagotchi
//
//  Created by 최민경 on 6/9/24.
//

import UIKit

protocol ReuseIdentifier {
    static var identifier: String { get }
}

extension UICollectionViewCell: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewController: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
