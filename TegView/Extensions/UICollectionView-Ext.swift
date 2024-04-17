//
//  UICollectionView-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 25.02.2024.
//

import UIKit

extension UICollectionView {
    
    convenience init(spacingForRow: CGFloat = .zero,
                     columSpacing: CGFloat = .zero,
                     sectionInset: UIEdgeInsets = .zero, cells: [UICollectionViewCell.Type]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = spacingForRow
        layout.minimumInteritemSpacing = columSpacing
        layout.sectionInset = sectionInset
        
        self.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.clipsToBounds = true
        
        cells.forEach({
            self.register($0.self, forCellWithReuseIdentifier: $0.identifier)
        })
    }
    
    convenience init(scrollDirection: UICollectionView.ScrollDirection,
                     lineSpacing: CGFloat,
                     interitemSpacing: CGFloat,
                     sectionInset: UIEdgeInsets,
                     cells: [UICollectionViewCell.Type]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interitemSpacing
        layout.sectionInset = sectionInset
        
        self.init(frame: .infinite, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.clipsToBounds = false
        
        cells.forEach({
            self.register($0.self, forCellWithReuseIdentifier: $0.identifier)
        })
    }
    
    
    func dequeueReusableCell<T: SelfConfiguringCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath) as? T else {
            fatalError("Error \(cellType)")
        }
        return cell
    }
}
