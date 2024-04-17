//
//  String-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 26.10.2023.
//

import UIKit

extension String {
    func hexColor() -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

            if (cString.hasPrefix("#")) {
                cString.remove(at: cString.startIndex)
            }

            if ((cString.count) != 6) {
                return UIColor.gray
            }

            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)

            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
    }
    
    func maxNumberOfLines(constraintedWidth width: CGFloat, font: UIFont) -> Int {
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        label.text = self
        label.font = font
        label.numberOfLines = 0
        label.sizeToFit()
        let height = label.frame.height
        
        label.numberOfLines = 1
        label.sizeToFit()
        let line = label.frame.height
        if line == 0 { return 0 }
        
        return Int(height / line)
    }
    
    func suitableSize(font sizeFont: UIFont, width: CGFloat) -> UIFont {
        var font = sizeFont
        var size = font.pointSize
        let frame = CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude)
        let label =  UILabel(frame: frame)
        label.text = self
        label.font = font
        
        label.numberOfLines = 0
        label.sizeToFit()
        var height = label.frame.height
        
        label.numberOfLines = 1
        label.sizeToFit()
        var standart = label.frame.height
        
        while height != standart {
            size -= 1
            font = UIFont(name: font.fontName, size: size) ?? font
            label.frame = frame
            label.font = font
            
            label.numberOfLines = 0
            label.sizeToFit()
            height = label.frame.height
            
            label.numberOfLines = 1
            label.sizeToFit()
            standart = label.frame.height
        }
        
        return font
    }
    
    func createText(font: UIFont, defaultColor: UIColor, editText: String, editingFont: UIFont, editingColor: UIColor) -> NSMutableAttributedString {
        let attrString = NSMutableAttributedString(string: self, attributes: [.font: font, .foregroundColor: defaultColor ])
        
        guard let range = self.range(of: editText) else { return attrString}
        attrString.addAttributes([.font: editingFont, .foregroundColor: editingColor], range: NSRange(range, in: self))
        return attrString
    }
    
    func searchCurrencyText() -> String {
        if self.isEmpty { return "" }
        do {
            let regex = try NSRegularExpression(pattern: "[\\d,\\.\\s]+", options: .caseInsensitive)
            let range = NSRange(self.startIndex..., in: self)
            let modifiedString = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "")
            return modifiedString
        } catch {
            return ""
        }
    }
    
    func convertionDate(from:String = "yyyy-MM-dd'T'HH:mm:ss") -> Date? {
        let formatter = DateFormatter.shared
        formatter.dateFormat = from
        return formatter.date(from: self)
    }

    func isValidateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }

    func widhtText(font: UIFont) -> CGFloat {
        let height = Int(font.pointSize)
        let label =  UILabel(frame: CGRect(x: 0, y: 0, width: .max, height: height))
        label.numberOfLines = 1
        label.text = self
        label.font = font
        label.sizeToFit()

        return label.bounds.width
    }
    
    
    func toInt() -> Int? {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        if numbers.isEmpty { return nil }
        return Int(numbers)
    }
    
    func isValidForSearch() -> Bool {
        let regex = #"^[\p{L}0-9, ]+$"#
        let emailPred = NSPredicate(format:"SELF MATCHES %@", regex)
        let valid = emailPred.evaluate(with: self)
        return valid
    }
}


extension StringProtocol {
    subscript(offset: Int) -> String { let data = self[index(startIndex, offsetBy: offset)]; return String(data) }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}

