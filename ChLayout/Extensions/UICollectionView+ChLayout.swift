//
//  ChLayout+UICollectionView.swift
//  ChLayout
//
//  Created by Вадим Балашов on 24/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

extension ChLayout where Base: UICollectionView {
    public static func create(_ layout: UICollectionViewLayout) -> Base {
        let view = Base(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = .zero
        return view
    }

}

extension UICollectionView {
    public func allowsSelection(_ allowsSelection: Bool) -> Self {
        self.allowsSelection = allowsSelection
        return self
    }
}
