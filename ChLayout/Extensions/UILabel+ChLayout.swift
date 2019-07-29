//
//  UILabel+ChLayout.swift
//  ChLayout
//
//  Created by Вадим Балашов on 24/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UILabel {
    public func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    public func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }

    public func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
}
