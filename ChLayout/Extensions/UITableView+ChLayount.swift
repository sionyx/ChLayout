//
//  UITableView+ChLayount.swift
//  ChLayout
//
//  Created by Вадим Балашов on 05.05.2020.
//  Copyright © 2020 sionyx.ru. All rights reserved.
//

import UIKit

extension UITableView {
    public func allowsSelection(_ allowsSelection: Bool) -> Self {
        self.allowsSelection = allowsSelection
        return self
    }

    public func separatorStyle(_ separatorStyle: UITableViewCell.SeparatorStyle) -> Self {
        self.separatorStyle = separatorStyle
        return self
    }

    public func separatorColor(_ separatorColor: UIColor) -> Self {
        self.separatorColor = separatorColor
        return self
    }
}
