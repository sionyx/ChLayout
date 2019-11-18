//
//  FloodLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 28/09/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

class FloodContainer: UIView {

    var baseWidth: CGFloat = 400

    private var currentWidth: CGFloat = 0

    private var container1: UIView!
    private var container2: UIView!

    private var verticalConstraints: [NSLayoutConstraint] = []
    private var horizontalConstraints: [NSLayoutConstraint] = []

    func containerFloodLayout(_ block: (() -> [UIView])) {
        let views = block()

        if container1 != nil {
            for subview in container1.subviews {
                subview.removeFromSuperview()
            }
        } else {
            container1 = UIView(frame: .zero)
            container1.backgroundColor = .clear
            container1.translatesAutoresizingMaskIntoConstraints = false
            addSubview(container1)
        }

        if container2 != nil {
            for subview in container1.subviews {
                subview.removeFromSuperview()
            }
        } else {
            container2 = UIView(frame: .zero)
            container2.backgroundColor = .clear
            container2.translatesAutoresizingMaskIntoConstraints = false
            addSubview(container2)
        }
        verticalConstraints.removeAll()
        horizontalConstraints.removeAll()

        let half = Int(ceil(Double(views.count) / 2))
        let subArray1 = Array(views[..<half])
        let subArray2 = Array(views[half...])

        fullfill(container: container1, with: subArray1)
        fullfill(container: container2, with: subArray2)

        container1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        container1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        container2.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        let bottomConstraint = container2.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.isActive = true
        bottomConstraint.priority = .defaultHigh

        verticalConstraints = [ container1.trailingAnchor.constraint(equalTo: trailingAnchor),
                                container2.leadingAnchor.constraint(equalTo: leadingAnchor),
                                container2.topAnchor.constraint(equalTo: container1.bottomAnchor) ]

        horizontalConstraints = [ container2.topAnchor.constraint(equalTo: topAnchor),
                                  container1.bottomAnchor.constraint(equalTo: bottomAnchor),
                                  container1.trailingAnchor.constraint(equalTo: container2.leadingAnchor),
                                  container1.widthAnchor.constraint(equalTo: container2.widthAnchor) ]

    }

    private func fullfill(container: UIView, with subviews: [UIView]) {
        var anchor = container.topAnchor
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(v)
            let margins = v.layoutMargins
            v.topAnchor.constraint(equalTo: anchor, constant: margins.top).isActive = true
            v.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: margins.left).isActive = true
            v.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -margins.right).isActive = true
            anchor = v.bottomAnchor
        }
        anchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }

    override func updateConstraints() {
        let width = bounds.size.width

        if width < baseWidth {
            NSLayoutConstraint.deactivate(horizontalConstraints)
            NSLayoutConstraint.activate(verticalConstraints)
        }
        else {
            NSLayoutConstraint.deactivate(verticalConstraints)
            NSLayoutConstraint.activate(horizontalConstraints)
        }

        container1.setNeedsLayout()
        container2.setNeedsLayout()

        super.updateConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let width = bounds.size.width
        if currentWidth != width {
            currentWidth = width
            setNeedsUpdateConstraints()
        }
    }
}

extension UIView {

    @discardableResult
    public func floodLayout(baseWidth: CGFloat, block: (() -> [UIView])) -> Self {
        let floodView = FloodContainer(frame: bounds)
        floodView.baseWidth = baseWidth
        floodView.translatesAutoresizingMaskIntoConstraints = false
        floodView.backgroundColor = .clear

        addSubview(floodView)

        floodView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        floodView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        floodView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        floodView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        floodView.containerFloodLayout(block)

        return self
    }

    @discardableResult
    public static func floodLayout(baseWidth: CGFloat, block: (() -> [UIView])) -> UIView {
        let floodView = FloodContainer(frame: .zero)
        floodView.baseWidth = baseWidth
        floodView.backgroundColor = .clear

        floodView.containerFloodLayout(block)

        return floodView
    }
}
