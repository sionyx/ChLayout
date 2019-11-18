//
//  UITextField+ChLayout.swift
//  ChLayout
//
//  Created by Вадим Балашов on 03/10/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UITextField {
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

    public func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    public func placeholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }

    public func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }

    public func placeholder(_ placeholder: String?, color: UIColor) -> Self {
        if let placeholder = placeholder {
            self.attributedPlaceholder = NSAttributedString(string:placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
        }
        return self
    }
}

