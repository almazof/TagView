//
//  UIView+Ex.swift
//  ShareCode
//
//  Created by Nicolay Bazhukov on 16.05.2023.
//

import UIKit

extension UIView {
    public func setWidth(width:CGFloat) {
        self.isHidden = false
        
        for item in self.constraints {
            if item.firstAttribute == .width {
                item.constant = width;
            }
        }
    }
    
    public func gone() {
        self.isHidden = true
        
        for item in self.constraints {
            if item.firstAttribute == .width {
                item.constant = 0;
            }
            
            if item.firstAttribute == .height {
                item.constant = 0;
            }
        }
    }
    
    public func setLeading(value:CGFloat) {
        for item in self.superview!.constraints {
            if (item.firstItem! as! UIView == self && item.firstAttribute == .leading) {
                item.constant = value;
            }
        }
    }
    
    public func setTop(value:CGFloat) {
        for item in self.superview!.constraints {
            if let firstItem = item.firstItem as? UIView {
                if firstItem == self && item.firstAttribute == .top {
                    item.constant = value
                }
            } else {
                if let secondItem = item.secondItem as? UIView, secondItem == self, item.secondAttribute == .top {
                    item.constant = value
                }
            }
        }
    }
    
    public func setBottom(value:CGFloat) {
        for item in self.superview?.constraints ?? [] {
            if let firstItem = item.firstItem as? UIView {
                if firstItem == self, item.firstAttribute == .bottom {
                    item.constant = value
                }
            } else {
                if let secondItem = item.secondItem as? UIView, secondItem == self, item.secondAttribute == .bottom {
                    item.constant = value
                }
            }
        }
    }
    
    public func setHeight(height:CGFloat) {
        self.isHidden = false
        
        for item in self.constraints {
            if item.firstAttribute == .height {
                item.constant = height
            }
        }
    }
    
    public func setWidth(width:CGFloat, height:CGFloat) {
        self.isHidden = false
        
        for item in self.constraints {
            if item.firstAttribute == .width {
                item.constant = width
            }
            
            if item.firstAttribute == .height {
                item.constant = height
            }
        }
    }
}

extension UIView {
    
    func shadow(_ color: UIColor! = UIColor.black) {
        self.layer.shadowColor = color?.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = false
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = 0.5
    }
    
    convenience init(_ color: UIColor) {
        self.init()
        self.backgroundColor = color
        self.clipsToBounds = true
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        })
    }
    
    func fullConstraint(top:CGFloat! = 0, bottom:CGFloat! = 0, leading:CGFloat! = 0, trailing:CGFloat! = 0, isSafeAria: Bool = false) {
        guard let view = self.superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: (isSafeAria ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor), constant: top),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
        ])
        
    }
    
    var cornerRadius: CGFloat {
        get { self.layer.cornerRadius}
        set { self.layer.cornerRadius = newValue; clipsToBounds = true}
    }
    
    var borderColor: UIColor {
        get { return .black}
        set { self.layer.borderColor = newValue.cgColor}
    }
    
    var borderWidth: CGFloat {
        get { return self.layer.borderWidth}
        set { self.layer.borderWidth = newValue}
    }
    
    func border(_ width: CGFloat, _ color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    func gradientBlur(from: GradientPoint, to: GradientPoint, startColor: UIColor, endColor: UIColor) {
        if let layers = self.layer.sublayers {
            for layer in layers {
                if layer is CAGradientLayer {
                    layer.frame = self.bounds
                    return
                }
            }
        }
        
        let gradientLayer = CAGradientLayer()
        let leftColor = startColor.cgColor
        let rightColor = endColor.cgColor
        gradientLayer.colors = [leftColor, rightColor]
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
        gradientLayer.locations = [0,0.9]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.clipsToBounds = true
    }
    
    func gradientBlur(from: GradientPoint, to: GradientPoint, gradient: (UIColor, UIColor)) {
        if let layers = self.layer.sublayers {
            for layer in layers {
                if layer is CAGradientLayer {
                    layer.frame = self.bounds
                    return
                }
            }
        }

        let gradientLayer = CAGradientLayer()
        let leftColor = gradient.0.cgColor
        let rightColor = gradient.1.cgColor
        gradientLayer.colors = [leftColor, rightColor]
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
        gradientLayer.locations = [0,0.9]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.clipsToBounds = true
    }
    
    func clearGradient() {
        if let layers = self.layer.sublayers {
            for layer in layers {
                if layer is CAGradientLayer {
                    layer.frame = .zero
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = []
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.clipsToBounds = true
    }
}

enum GradientPoint {
    case topLeading
    case leading
    case bottomLeading
    case top
    case center
    case bottom
    case topTrailing
    case trailing
    case bottomTrailing

    var point: CGPoint {
        switch self {
        case .topLeading:
            return CGPoint(x: 0, y: 0)
        case .leading:
            return CGPoint(x: 0, y: 0.5)
        case .bottomLeading:
            return CGPoint(x: 0, y: 1.0)
        case .top:
            return CGPoint(x: 0.5, y: 0)
        case .center:
            return CGPoint(x: 0.5, y: 0.5)
        case .bottom:
            return CGPoint(x: 0.5, y: 1.0)
        case .topTrailing:
            return CGPoint(x: 1.0, y: 0.0)
        case .trailing:
            return CGPoint(x: 1.0, y: 0.5)
        case .bottomTrailing:
            return CGPoint(x: 1.0, y: 1.0)
        }
    }
}


extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? String(describing: Self.self)
        guard let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        else { fatalError("missing expected nib named: \(name)") }
        guard let view = nib.first as? Self
        else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
}
