//
//  UIImage+ChLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 24/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIImageView {
    public func image(_ image: UIImage) -> Self {
        self.image = image
        return self
    }

    public func imageNamed(_ name: String) -> Self {
        self.image = UIImage(named: name)
        return self
    }

    public func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
}
