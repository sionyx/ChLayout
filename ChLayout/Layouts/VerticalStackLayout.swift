//
//  VerticalStackLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 22/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    public func verticalStackLayout(_ block: (() -> [UIView])) -> Self {
        let views = block()

        var anchor = self.topAnchor
        for v in views {
            v.translatesAutoresizingMaskIntoConstraints = false
            addSubview(v)
            let margins = v.layoutMargins
            v.topAnchor.constraint(equalTo: anchor, constant: margins.top).isActive = true
            v.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left).isActive = true
            v.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margins.right).isActive = true
            anchor = v.bottomAnchor
        }

        return self
    }
}
