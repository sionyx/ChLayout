//
//  FillLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 23/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {
    func fillLayout(_ block: (() -> UIView)) {
        let view = block()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let margins = view.layoutMargins
        view.topAnchor.constraint(equalTo: topAnchor, constant: margins.top).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margins.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margins.left).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margins.right).isActive = true
    }
}
