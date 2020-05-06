//
//  UIActivityIndicatorView+ChLayount.swift
//  ChLayout
//
//  Created by Вадим Балашов on 18.11.2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    public func color(_ color: UIColor) -> Self {
        self.color = color
        return self
    }

    public func style(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }

    public func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
        self.hidesWhenStopped = hidesWhenStopped
        return self
    }
}
