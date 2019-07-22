//
//  SafeAreaLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 22/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView {
    func safeAreaLayout(_ block: (() -> UIView)) {
        let view = block()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        let margins = view.layoutMargins
        view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: margins.top).isActive = true
        view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -margins.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: margins.left).isActive = true
        view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -margins.right).isActive = true
    }
}
