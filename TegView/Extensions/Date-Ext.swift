//
//  Date-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 27.03.2024.
//

import Foundation
extension Date {
    func toString(_ format:String! = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter.shared
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
