//
//  UIImageView+Extra.swift
//  ShareCode
//
//  Created by Nicolay Bazhukov on 07.11.2022.
//

import UIKit

extension UIImageView {
    
    var colorRenderForImage:UIColor {
        get {return self.tintColor}
        set {
            self.image = self.image?.withRenderingMode(.alwaysTemplate)
            self.tintColor = newValue
        }
    }
    
    
    convenience init(background: UIColor, image: UIImage?, corner: CGFloat = 0 ) {
        self.init(image: image)
        self.backgroundColor = background
        self.clipsToBounds = true
        self.cornerRadius = corner
        self.contentMode = .scaleAspectFill
    }
}
