//
//  HorizontalSplitLayout.swift
//  ChLayout
//
//  Created by Вадим Балашов on 29/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    public func horizontalSplitLayout(_ block: (() -> (left: UIView, right: UIView))) -> Self {
        let pair = block()
        let left = pair.left
        left.translatesAutoresizingMaskIntoConstraints = false
        addSubview(left)
        let leftMargins = left.layoutMargins
        left.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leftMargins.left).isActive = true
        left.topAnchor.constraint(equalTo: topAnchor, constant: leftMargins.top).isActive = true
        left.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -leftMargins.bottom).isActive = true

        let right = pair.right
        right.translatesAutoresizingMaskIntoConstraints = false
        addSubview(right)
        let rightMargins = right.layoutMargins
        right.leadingAnchor.constraint(equalTo: left.trailingAnchor, constant: rightMargins.left).isActive = true
        right.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -rightMargins.right).isActive = true
        right.topAnchor.constraint(equalTo: topAnchor, constant: rightMargins.top).isActive = true
        right.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -rightMargins.bottom).isActive = true

        return self
    }
}
