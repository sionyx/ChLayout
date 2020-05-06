//
//  UIRefreshControl+ChLayount.swift
//  ChLayout
//
//  Created by Вадим Балашов on 05.05.2020.
//  Copyright © 2020 sionyx.ru. All rights reserved.
//

import UIKit

extension UIRefreshControl {
    public func tintColor(_ tintColor: UIColor) -> Self {
        self.tintColor = tintColor
        return self
    }

    public func attributedTitle(_ attributedTitle: NSAttributedString?) -> Self {
        self.attributedTitle = attributedTitle
        return self
    }
}
