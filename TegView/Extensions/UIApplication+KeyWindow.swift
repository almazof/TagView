//
//  UIApplication+KeyWindow.swift
//  LIR
//
//  Created by Nicolay Bazhukov on 25.02.2022.
//

import UIKit

extension UIApplication {
    
    public func safeAreaInsetsBottom() -> CGFloat
    {
        if(self.lirKeyWindow == nil)
        {
            return 0
        }
        
        return self.lirKeyWindow!.safeAreaInsets.bottom
    }
    
    public func safeAreaInsetsTop() -> CGFloat
    {
        if(self.lirKeyWindow == nil)
        {
            return 0
        }

        return self.lirKeyWindow!.safeAreaInsets.top
    }
    
    public func safeAreaInsetsLeft() -> CGFloat
    {
        if(self.lirKeyWindow == nil)
        {
            return 0
        }

        return self.lirKeyWindow!.safeAreaInsets.left
    }
    
    public func safeAreaInsetsRight() -> CGFloat
    {
        if(self.lirKeyWindow == nil)
        {
            return 0
        }

        return self.lirKeyWindow!.safeAreaInsets.right
    }
    
    public var lirKeyWindow: UIWindow? {
            // Get connected scenes
            
        return self.keyWindow
        
        /*
            return UIApplication.shared.connectedScenes
                // Keep only active scenes, onscreen and visible to the user
                .filter { $0.activationState == .foregroundActive }
                // Keep only the first `UIWindowScene`
                .first(where: { $0 is UIWindowScene })
                // Get its associated windows
                .flatMap({ $0 as? UIWindowScene })?.windows
                // Finally, keep only the key window
                .first(where: \.isKeyWindow)
         */
    }
    
}
