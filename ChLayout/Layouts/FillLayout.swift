//
//  FillLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 23/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    public func fillLayout(maxWidth: CGFloat? = nil, block: (() -> UIView)) -> Self {
        let view = block()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let margins = view.layoutMargins
        view.topAnchor.constraint(equalTo: topAnchor, constant: margins.top).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margins.bottom).isActive = true

        if let maxWidth = maxWidth {
            view.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: margins.left).isActive = true
            view.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -margins.right).isActive = true
            view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            view.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
            let widthConstraint = view.widthAnchor.constraint(equalToConstant: maxWidth)
            widthConstraint.priority = .defaultHigh
            widthConstraint.isActive = true
        }
        else {
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margins.right).isActive = true
        }

        return self
    }

    public func fillLayout(maxWidth: CGFloat? = nil, block: (() -> [UIView])) -> Self {
        let views = block()

        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
            let margins = view.layoutMargins
            view.topAnchor.constraint(equalTo: topAnchor, constant: margins.top).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margins.bottom).isActive = true

            if let maxWidth = maxWidth {
                view.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: margins.left).isActive = true
                view.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor, constant: -margins.right).isActive = true
                view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
                view.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth).isActive = true
                let widthConstraint = view.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth)
                widthConstraint.priority = .defaultHigh
                widthConstraint.isActive = true
            }
            else {
                view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left).isActive = true
                view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margins.right).isActive = true
            }
        }

        return self
    }

    @discardableResult
    public static func fillLayout(maxWidth: CGFloat? = nil, block: (() -> UIView)) -> UIView {
        return UIView.ch.create().fillLayout(maxWidth: maxWidth, block: block)
    }

    @discardableResult
    public static func fillLayout(maxWidth: CGFloat? = nil, block: (() -> [UIView])) -> UIView {
        return UIView.ch.create().fillLayout(maxWidth: maxWidth, block: block)
    }
}
