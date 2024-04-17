//
//  UITextView-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 04.11.2023.
//

import UIKit

extension UITextView {
    func addToolBar(_ target:Any?, action:Selector, title: String) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let buttonDone = UIBarButtonItem(title: title, style: .done, target: target, action: action)
        let flexSpase = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpase, buttonDone], animated: false)
        self.inputAccessoryView = toolBar
        toolBar.updateConstraintsIfNeeded()
    }
}
