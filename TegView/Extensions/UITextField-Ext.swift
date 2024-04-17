//
//  UITextField-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 27.10.2023.
//

import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
    
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
