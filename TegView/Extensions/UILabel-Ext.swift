//
//  UILabel-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 26.10.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text:String?, ofSize fontSize: CGFloat, weight: UIFont.Weight, color:UIColor? = .custom.black, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = color
        self.textAlignment = textAlignment
    }
    
    convenience init(text:String? = nil, font: UIFont? = nil, color:UIColor? = .custom.black) {
        self.init()
        self.text = text
        self.backgroundColor = .clear
        if let font = font { self.font = font }
        self.textColor = color
    }
    
    
    func setAttributed(text: String,
                       font: UIFont? = nil,
                       alignment: NSTextAlignment? = nil,
                       lineHeightMultiple: CGFloat? = nil,
                       lineSpacing: CGFloat? = nil,
                       textColor: UIColor? = .custom.black,
                       lineBreakMode: NSLineBreakMode? = nil) {
        
        let labelText = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        if let lineHeightMultiple = lineHeightMultiple {
            paragraphStyle.lineHeightMultiple = lineHeightMultiple
        }
        
        paragraphStyle.alignment = alignment ?? self.textAlignment
        
        if let lineSpacing = lineSpacing {
            paragraphStyle.lineSpacing = lineSpacing
        }
        
        if let lineBreakMode = lineBreakMode{
            paragraphStyle.lineBreakMode = lineBreakMode
        }
        
    
        labelText.append(NSAttributedString(
            string: text,
            attributes: [
                .font: font ?? self.font!,
                .foregroundColor: textColor!,
                .paragraphStyle: paragraphStyle
            ]
        ))
        
        attributedText = labelText
    }
    
    func height(width: CGFloat) -> CGFloat {
        let frame = CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude)
        let label: UILabel! = .init(frame: frame)
        label.numberOfLines = 0
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        let height = label.frame.height
        return height
    }
    
    func width(height: CGFloat) -> CGFloat {
        let frame = CGRect(x: 0, y: 0, width: .greatestFiniteMagnitude, height: height)
        let label: UILabel! = .init(frame: frame)
        label.numberOfLines = 0
        label.text = text
        label.attributedText = attributedText
        label.sizeToFit()
        let height = label.frame.height
        return height
    }
}
