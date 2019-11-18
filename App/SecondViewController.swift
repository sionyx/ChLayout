//
//  SecondViewController.swift
//  chlayout
//
//  Created by Вадим Балашов on 21/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var blockedCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.safeAreaLayout {
            UICollectionView.ch.create(UICollectionViewFlowLayout()).ch.named(&blockedCollectionView).ch.setup {
                $0.backgroundColor = UIColor.yellow
            }
        }
    }
}
