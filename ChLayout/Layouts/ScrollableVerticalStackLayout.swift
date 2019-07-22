//
//  ScrollableVerticalStackLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 22/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIScrollView {
    func scrollableVerticalStackLayout(_ block: (() -> [UIView])) {
        let contentView = UIView(frame: CGRect.zero)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        let yAnchor = contentView.centerYAnchor.constraint(equalTo: centerYAnchor)
        yAnchor.priority = .defaultLow
        yAnchor.isActive = true
        let bAnchor = contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bAnchor.priority = .defaultLow
        bAnchor.isActive = true

        let views = block()

        var anchor = contentView.topAnchor
        var lastView: UIView? = nil
        for v in views {
            v.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(v)
            let margins = v.layoutMargins
            v.topAnchor.constraint(equalTo: anchor, constant: margins.top).isActive = true
            v.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margins.left).isActive = true
            v.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margins.right).isActive = true
            anchor = v.bottomAnchor
            lastView = v
        }
        if let lastView = lastView {
            let margins = lastView.layoutMargins
            lastView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margins.bottom).isActive = true
        }
    }
}
