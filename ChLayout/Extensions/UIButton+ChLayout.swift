//
//  UIButton+ChLayout.swift
//  ChLayout
//
//  Created by Вадим Балашов on 29/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIButton {
    public func title(_ title: String?, state: UIControl.State = .normal) -> Self {
        setTitle(title, for: state)
        return self
    }

    public func titleColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }

    public func titleFont(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }

    public func image(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }

    public func imageNamed(_ name: String, state: UIControl.State = .normal) -> Self {
        setImage(UIImage(named: name), for: state)
        return self
    }

    public func backgroundImage(_ image: UIImage, state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }

    public func backgroundImageNamed(_ name: String, state: UIControl.State = .normal) -> Self {
        setBackgroundImage(UIImage(named: name), for: state)
        return self
    }

    public func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }

    public func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }

    public func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
}
