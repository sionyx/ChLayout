//
//  UIView+ChLayout.swift
//  ChLayout
//
//  Created by Вадим Балашов on 24/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {
    public func margins(_ margins: UIEdgeInsets) -> Self {
        layoutMargins = margins
        return self
    }

    public func backgroundColor(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }

    public func whiteBG() -> Self {
        backgroundColor = UIColor.white
        return self
    }

    public func cornerRadius(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        return self
    }

    public func borderColor(_ color: UIColor) -> Self {
        layer.borderColor = color.cgColor
        return self
    }

    public func borderWidth(_ width: CGFloat) -> Self {
        layer.borderWidth = width
        return self
    }

    @discardableResult
    public func shadow(color: UIColor, opacity: Float = 1.0, offset: CGSize = CGSize(width: 1, height: 1), radius: CGFloat = 1) -> Self {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        return self
    }

    public func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }

    public func hidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    public func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
}


extension UIView {
    @discardableResult
    public func height(_ height: CGFloat) -> Self {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    @discardableResult
    public func width(_ width: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }

    public func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> UIView {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }

    public func contentHuggingPriority(_ priorityValue: Float, for axis: NSLayoutConstraint.Axis) -> UIView {
        self.setContentHuggingPriority(UILayoutPriority(rawValue: priorityValue), for: axis)
        return self
    }

    public func horizontalContentHuggingPriority(_ priorityValue: Float) -> UIView {
        self.setContentHuggingPriority(UILayoutPriority(rawValue: priorityValue), for: .horizontal)
        return self
    }

    public func verticalContentHuggingPriority(_ priorityValue: Float) -> UIView {
        self.setContentHuggingPriority(UILayoutPriority(rawValue: priorityValue), for: .vertical)
        return self
    }
}
