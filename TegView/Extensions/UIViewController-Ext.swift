//
//  UIViewController-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 02.12.2023.
//

import UIKit

extension UIViewController {
    func alert(title: String?, message: String?, buttonTitle: String? = "Close") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(.init(title: "Close", style: .cancel))
        self.present(alert, animated: true)
    }
    
    func alert(title: String?, message: String?, clouseButton action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(.init(title: "Close", style: .cancel, handler: action))
        self.present(alert, animated: true)
    }
    
    func alert(title: String?, message: String?, buttonTitle: String?, action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(.init(title: "Close", style: .cancel, handler: nil))
        alert.addAction(.init(title: buttonTitle, style: .default, handler: action))
        self.present(alert, animated: true)
    }
}

//MARK: - Keyboard
extension UIViewController {
    func activeKeybordNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    // open keyboard
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        ///высота клавиатуры
        let userInfo = notification.userInfo!
        let height = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        keyboardStatus(isPresent: true, height: height)
    }
    
    
    // cloused keyboard
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        keyboardStatus(isPresent: false, height: 0)
    }
    
    // оповещаем изменение
    @objc func keyboardStatus(isPresent: Bool, height: CGFloat) {}
}


extension UIViewController {
    class var classIdentifier: String { return String(describing: Self.self) }
    
    class var storyboardInit: Self? {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: Self.classIdentifier) as? Self
        return viewController
    }
}
