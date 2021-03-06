//
//  VerticalSplitLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 23/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    public func verticalSplitLayout(_ block: (() -> (top: UIView, bottom: UIView))) -> Self {
        let pair = block()
        let top = pair.top
        top.translatesAutoresizingMaskIntoConstraints = false
        addSubview(top)
        let topMargins = top.layoutMargins
        top.topAnchor.constraint(equalTo: topAnchor, constant: topMargins.top).isActive = true
        top.leadingAnchor.constraint(equalTo: leadingAnchor, constant: topMargins.left).isActive = true
        top.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -topMargins.right).isActive = true

        let bottom = pair.bottom
        bottom.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottom)
        let bottomMargins = bottom.layoutMargins
        bottom.topAnchor.constraint(equalTo: top.bottomAnchor, constant: topMargins.bottom).isActive = true
        bottom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: bottomMargins.left).isActive = true
        bottom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -bottomMargins.right).isActive = true
        bottom.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomMargins.bottom).isActive = true

        return self
    }

    @discardableResult
    public static func verticalSplitLayout(_ block: (() -> (top: UIView, bottom: UIView))) -> UIView {
        return UIView.ch.create().verticalSplitLayout(block)
    }
}
