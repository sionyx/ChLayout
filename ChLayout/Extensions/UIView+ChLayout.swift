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
}


extension UIView {
    public func height(_ height: CGFloat) -> Self {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    public func width(_ width: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
}
