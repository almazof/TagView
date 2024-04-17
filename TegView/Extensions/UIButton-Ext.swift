//
//  UIButton-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 29.10.2023.
//

import UIKit

extension UIButton {
    
    convenience init(backgroundColor:UIColor = .clear, textColor:UIColor, text:String?, radius:CGFloat! = 0) {
        self.init()
        self.backgroundColor = backgroundColor
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.setTitleColor(.gray, for: .focused)
        self.setTitleColor(.gray, for: .highlighted)
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    convenience init(tintColor: UIColor, backgroundColor: UIColor = .clear, textColor: UIColor, text: String? = nil, radius:CGFloat! = 0) {
        self.init()
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.setTitleColor(.gray, for: .focused)
        self.setTitleColor(.gray, for: .highlighted)
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
