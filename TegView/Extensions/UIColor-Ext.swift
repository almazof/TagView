//
//  UIColor-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 29.10.2023.
//

import UIKit

extension UIColor {
    class var custom: CustomColor.Type { return CustomColor.self }
    
    class CustomColor {
        //0B3871
        class var blueCell: UIColor { return UIColor(red: 0.0431372549, green: 0.2196078431, blue: 0.4431372549, alpha: 1) }
        
        //DCEBFF
        class var whiteCell: UIColor { return UIColor(red: 0.862745098, green: 0.9215686275, blue: 1, alpha: 1) }

        //F33770
        class var pink: UIColor { return UIColor(red: 0.9529411765, green: 0.2156862745, blue: 0.4392156863, alpha: 1) }

        //A8CEFF
        class var silverBlue: UIColor { return UIColor(red: 0.6588235294, green: 0.8078431373, blue: 1, alpha: 1) }
        
        //818196
        class var gray3: UIColor { return UIColor(red: 0.5058823529, green: 0.5058823529, blue: 0.5882352941, alpha: 1) }
        
        //noselectedsmallTextColor
        class var noselectedsmallTextColor: UIColor { return UIColor(named: "noselectedsmallTextColor") ?? .systemGray3 }
        class var noselectedframeBg: UIColor { return UIColor(named: "noselectedframeBg") ?? .systemGray6 }
        class var lightSelectBlue: UIColor { return UIColor(named: "frameBg") ?? .systemBlue.withAlphaComponent(0.2) }
        
        
        //DEECFE
        class var lightBlue: UIColor { return UIColor(red: 0.8705882353, green: 0.9254901961, blue: 0.9960784314, alpha: 1) }
        class var lightBlue2: UIColor { return UIColor(red: 0.7607843137, green: 0.862745098, blue: 0.9960784314, alpha: 1) }
        
        //4880EB
        class var blue: UIColor { return UIColor(red: 0.2823529412, green: 0.5019607843, blue: 0.9215686275, alpha: 1) }
        
        //1B5BCC
        class var darkBlue: UIColor { return UIColor(red: 0.1058823529, green: 0.3568627451, blue: 0.8, alpha: 1) }
        
        //CFDFF4
        class var lightBorderBlue: UIColor { return UIColor(red: 0.8117647059, green: 0.8745098039, blue: 0.9568627451, alpha: 1) }
        
        //9398AE
        class var gray: UIColor { return UIColor(red: 0.5764705882, green: 0.5960784314, blue: 0.6823529412, alpha: 1) }
        
        //DADADA
        class var gray2: UIColor { return UIColor(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1) }
       
        //F4F4FF
        class var background: UIColor { return UIColor(red: 0.9568627451, green: 0.9568627451, blue: 1, alpha: 1)}
        
        //FBFCFF
        class var lightGray: UIColor { return UIColor(red: 0.937254902, green: 0.9647058824, blue: 1, alpha: 1) }
        
        class var white: UIColor { return .white }
        class var black: UIColor { return .black }
        
        
        
        //0040AF - 5E94FE
        class var gradientBlue: (start: UIColor, end: UIColor) {
            return (UIColor(red: 0, green: 0.2509803922, blue: 0.6862745098, alpha: 1),
                    UIColor(red: 0.368627451, green: 0.5803921569, blue: 0.9960784314, alpha: 1))
        }
        
        //F7366B - A068F8
        class var gradientLilac: (start: UIColor, end: UIColor) {
            return (UIColor(red: 0.968627451, green: 0.2117647059, blue: 0.4196078431, alpha: 1),
                    UIColor(red: 0.6274509804, green: 0.4078431373, blue: 0.9725490196, alpha: 1))
        }
        
        //FF8990 - EB4564
         class var gradientRed: (start: UIColor, end: UIColor) {
            return (UIColor(red: 1, green: 0.537254902, blue: 0.5647058824, alpha: 1),
                    UIColor(red: 0.9215686275, green: 0.2705882353, blue: 0.3921568627, alpha: 1))
        }
    }
}
