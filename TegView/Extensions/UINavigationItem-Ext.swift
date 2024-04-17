//
//  UINavigationItem-Ext.swift
//  HashtagHunter
//
//  Created by Алмаз Рахматуллин on 18.03.2024.
//

import UIKit

extension UINavigationItem {
    func setTitleView(title: String?, subtitle: String?) {
        if title == nil && subtitle == nil { return }
        let bigTitleLabel = UILabel(text: title, ofSize: 19, weight: .semibold, color: .custom.white, textAlignment: .center)
        let titleLabel = UILabel(text: title, ofSize: 18, weight: .medium, color: .custom.white, textAlignment: .center)
        let subtitleLabel = UILabel(text: subtitle, ofSize: 13, weight: .semibold, color: .custom.white, textAlignment: .center)
        
        let stackView = UIStackView(.vertical, .fill, .fill, 2, [bigTitleLabel, titleLabel, subtitleLabel])
        
        titleView = stackView
        
        let isEmptyTitle = (title ?? "").isEmpty
        let isEmptySubtitle = (subtitle ?? "").isEmpty
        
        bigTitleLabel.isHidden = !isEmptySubtitle || isEmptySubtitle && isEmptyTitle
        subtitleLabel.isHidden = isEmptySubtitle
        titleLabel.isHidden = isEmptySubtitle
    }
}
