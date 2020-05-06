//
//  ChLayout+View.swift
//  chlayout
//
//  Created by Вадим Балашов on 22/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension UIView: ChLayoutCompatible { }

/// Initializers
extension ChLayout where Base: UIView {
    /// Creates View from xib
    public static func fromXib(_ xibName: String? = nil) -> Base {
        let nibName = xibName ?? String(describing: Base.self)
        let view = UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first as! Base
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = .zero
        return view
    }

    /// Creates View
    public static func create() -> Base {
        let view = Base(frame: CGRect.zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = .zero
        return view
    }
}

/// Property setters
extension ChLayout where Base: UIView {
    public func named(_ view: inout Base?) -> Base {
        view = self.base
        return self.base
    }

    public func setup(_ block: (Base) -> Void) -> Base {
        block(self.base)
        return self.base
    }

    public func addSubview(_ view: UIView) -> Self {
        self.base.addSubview(view)
        return self
    }

    public func addSubview(_ viewBlock: () -> UIView) -> Self {
        let view = viewBlock()
        self.base.addSubview(view)
        return self
    }

    public func insertSubview(_ view: UIView, at position: Int) -> Self {
        self.base.insertSubview(view, at: position)
        return self
    }

    public func insertSubview(at position: Int, viewBlock: () -> UIView) -> Self {
        let view = viewBlock()
        self.base.insertSubview(view, at: position)
        return self
    }
}

