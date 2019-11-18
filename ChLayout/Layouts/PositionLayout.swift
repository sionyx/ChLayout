//
//  PositionLayout.swift
//  ChLayout
//
//  Created by Вадим Балашов on 26/09/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {

    public enum HorizintalPosition {
        case left(CGFloat)
        case right(CGFloat)
        case center
    }

    public enum VerticalPosition {
        case top(CGFloat)
        case bottom(CGFloat)
        case center
    }

    @discardableResult
    public func positionLayout(horizontal: HorizintalPosition, vertical: VerticalPosition, block: (() -> UIView)) -> Self {
        let view = block()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        switch horizontal {
        case .left(let left):
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: left).isActive = true
        case .right(let right):
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -right).isActive = true
        case .center:
            view.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }

        switch vertical {
        case .top(let top):
            view.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        case .bottom(let bottom):
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottom).isActive = true
        case .center:
            view.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        }

        return self
    }

    @discardableResult
    public static func positionLayout(horizontal: HorizintalPosition, vertical: VerticalPosition, block: (() -> UIView)) -> UIView {
        return UIView.ch.create().positionLayout(horizontal: horizontal, vertical: vertical, block: block)
    }
}
