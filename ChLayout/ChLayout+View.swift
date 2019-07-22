//
//  ChLayout+View.swift
//  chlayout
//
//  Created by Вадим Балашов on 22/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView: ChLayoutCompatible { }

extension ChLayout where Base: UIView {
    static func fromXib(_ xibName: String? = nil) -> Base {
        let nibName = xibName ?? String(describing: Base.self)
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as! Base
    }

    static func fromXibNamed(_ view: inout Base?, xibName: String? = nil) -> Base {
        let nibName = xibName ?? String(describing: Base.self)
        let newView = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as! Base
        view = newView
        return newView
    }

    static func named(_ view: inout Base?) -> Base {
        let newView = Base(frame: CGRect.zero)
        view = newView
        return newView
    }

    static func setup(_ block: (Base) -> Void) -> Base {
        let newView = Base(frame: CGRect.zero)
        block(newView)
        return newView
    }

    func setup(_ block: (Base) -> Void) -> Base {
        block(self.base)
        return self.base
    }
}
