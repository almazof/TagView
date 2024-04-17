//
//  UIFont-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 29.10.2023.
//

import UIKit

extension UIFont {
    
    enum SFProText: String {
        case light = "SFProText-Light"
        case regular = "SFProText-Regular"
        case medium = "SFProText-Medium"
        case bold = "SFProText-Bold"
        case semibold = "SFProText-Semibold"
        case heavy = "SFProText-Heavy"
        case black = "SF-Pro-Text-Black"
    }
    
    class func sfProText(ofSize fontSize: CGFloat, weight: UIFont.SFProText) -> UIFont {
        return UIFont(name: weight.rawValue, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
}


