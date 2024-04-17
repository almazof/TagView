//
//  ViewController.swift
//  TegView
//
//  Created by Алмаз Рахматуллин on 24.01.2024.
//

import UIKit

class TagView: UIView {
    
}

class UITegListView: UIView {
    
}


protocol UITegViewDataSource: AnyObject {
    func numberOfTags(_ tagView: UITegView) -> Int
    func tagView(_ tagView: UITegView, text forIndex: Int) -> String?
}


class UITegView: UIView {
    private let tagView: UITegListView = .init()
    
    var tagDefaultBackgroundColor: UIColor = UIColor(red: 0.7607843137, green: 0.862745098, blue: 0.9960784314, alpha: 1) {
        didSet {
            setupStyle()
        }
    }
    
    var taErrorgBackgroundColor: UIColor = #colorLiteral(red: 0.9882352941, green: 0.8, blue: 0.8078431373, alpha: 1) {
        didSet {
            setupStyle()
        }
    }
    
    var textColor: UIColor = #colorLiteral(red: 0.1058823529, green: 0.3568627451, blue: 0.8, alpha: 1) {
        didSet {
            setupStyle()
        }
    }
    
    var spacing: CGFloat = 5 {
        didSet {
            setupStyle()
        }
    }
    
    var lineSpacing: CGFloat = 7 {
        didSet {
            setupStyle()
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        let color = UIColor(red: 0.2823529412, green: 0.5019607843, blue: 0.9215686275, alpha: 1)
        border(2, color)
        cornerRadius = 20
        backgroundColor = .white
        
        //
        let glassImage = UIImage(named: "magnifyingglass")
        let glassImageView = UIImageView(image: glassImage)
        glassImageView.contentMode = .scaleToFill
        
        //plusButton
        let plusButton = UIButton()
        plusButton.setImage(.init(named: "plus"), for: .normal)
        
        tagView.backgroundColor = .systemGreen
        
        self.addSubviews(glassImageView, tagView, plusButton)
        
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            glassImageView.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            glassImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            glassImageView.heightAnchor.constraint(equalToConstant: 15),
            glassImageView.widthAnchor.constraint(equalTo: glassImageView.heightAnchor),
            
            tagView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            tagView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            tagView.leadingAnchor.constraint(equalTo: glassImageView.trailingAnchor, constant: 15),
//            tagView.heightAnchor.constraint(equalToConstant: 150),
            
            plusButton.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            plusButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            plusButton.leadingAnchor.constraint(equalTo: tagView.trailingAnchor),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            plusButton.widthAnchor.constraint(equalTo: plusButton.heightAnchor),

        ])
    }
    
    private func setupStyle() {
        
    }
}

class ViewController: UIViewController {
    let tagView = UITegView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tagView)
        view.backgroundColor = .systemGray5
        tagView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tagView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tagView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            tagView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
}


//MARK: - SwiftUI
import SwiftUI
struct Provider_ViewController : PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        typealias UIViewControllerType = UIViewController
        
        
        let viewController = ViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) -> ViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: Provider_ViewController.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<Provider_ViewController.ContainterView>) {
            
        }
    }
}

