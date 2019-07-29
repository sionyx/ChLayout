//
//  UIScrollView+ChLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 24/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIScrollView {
    public func bounceHorizontal(_ bounce: Bool) -> Self {
        alwaysBounceHorizontal = bounce
        return self
    }

    public func bounceVertical(_ bounce: Bool) -> Self {
        alwaysBounceVertical = bounce
        return self
    }
}
