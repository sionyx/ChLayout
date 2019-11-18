//
//  UIScrollView+ChLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 24/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIScrollView {

    public enum ScrollIndicatorVisibility {
        case show
        case hide
    }

    public func bounceHorizontal(_ bounce: Bool) -> Self {
        alwaysBounceHorizontal = bounce
        return self
    }

    public func bounceVertical(_ bounce: Bool) -> Self {
        alwaysBounceVertical = bounce
        return self
    }

    public func horizontalScrollIndicator(_ visibility: ScrollIndicatorVisibility) -> Self {
        showsHorizontalScrollIndicator = visibility == .show
        return self
    }

    public func verticalScrollIndicator(_ visibility: ScrollIndicatorVisibility) -> Self {
        showsVerticalScrollIndicator = visibility == .show
        return self
    }

    public func contentInset(_ inset: UIEdgeInsets) -> Self {
        contentInset = inset
        return self
    }
}
