//
//  ChLayout.swift
//  chlayout
//
//  Created by Вадим Балашов on 21/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import Foundation

public struct ChLayout<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol ChLayoutCompatible {
    associatedtype ChLayoutBase

    static var ch: ChLayout<ChLayoutBase>.Type { get }
    var ch: ChLayout<ChLayoutBase> { get }
}

extension ChLayoutCompatible {
    public static var ch: ChLayout<Self>.Type {
        return ChLayout<Self>.self
    }

    public var ch: ChLayout<Self> {
        return ChLayout(self)
    }
}

extension ChLayout where Base: AnyObject {
    public func set<V>(_ path: ReferenceWritableKeyPath<Base, V>, _ value: V) -> Base {
        base[keyPath: path] = value
        return base
    }

    public func exec(_ blockPath: KeyPath<Base, () -> Void>) -> Base {
        let f = base[keyPath: blockPath]
        f()
        return base
    }
}

extension ChLayout where Base: NSObject {
    public func perform(_ selector: Selector) -> Base {
        base.perform(selector)
        return base
    }
}
