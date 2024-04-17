//
//  UICollectionViewCell-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 16.11.2023.
//

import UIKit

protocol SelfConfiguringCell {
    static var identifier: String { get }
}


extension UICollectionViewCell: SelfConfiguringCell {
    static var identifier: String { return String.init(describing: Self.self)}
}
