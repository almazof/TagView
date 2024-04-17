//
//  Double-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 19.11.2023.
//

import Foundation
extension Double {
    
    func currency(_ code: String? = nil) -> String {
        let separator = "."
        var num = self
        let array = String(self).components(separatedBy: separator)
        let first = array.first ?? "0"
        var drop = "00"
       
        if array.count > 1, !array[1].isEmpty {
            let last = array[1] + "0"
            drop = String(last[0...1])
            let string = String(first) + separator + drop
            num = Double(string) ?? self
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.decimalSeparator = separator
        numberFormatter.groupingSeparator = " "
       
        if let currencySymbol = code {
            numberFormatter.currencySymbol = currencySymbol
        } else {
            numberFormatter.currencyCode = Locale.current.currencyCode
        }
        
        let number = NSNumber(floatLiteral: num)
        guard let text = numberFormatter.string(from: number) else {return "0"}
        
        if drop == "00" || drop == "0" {
            return text.replacingOccurrences(of: separator + "00", with: "")
        }
        
        return text.replacingOccurrences(of: separator + drop, with: separator + String(drop.first ?? "0"))
    }
}
