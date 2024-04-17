//
//  Error-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 19.12.2023.
//

import Foundation
extension Error {
    func print(file: String = "--", line: Int = 0, function: String = "--") {
        Swift.print("\n\n\n -------------- Error ----------------\n")
        Swift.print("-- file ->", file, "\n-- line ->", line, "\n-- function ->", function, "\n\n")
        Swift.print(self.localizedDescription)
        Swift.print("\n----------------", "end", "----------------\n\n\n")
    }
}
