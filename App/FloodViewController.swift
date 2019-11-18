//
//  FloodViewController.swift
//  chlayout
//
//  Created by Вадим Балашов on 28/09/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

class FloodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.verticalStackLayout {[
            UIView.ch.create()
                .backgroundColor(.green)
            //.height(400)
            .floodLayout(baseWidth: 500) {[
            UILabel.ch.create()
                .text("123")
                .textColor(.blue),
            UIImageView.ch.create()
                .imageNamed("test")
                .contentMode(.scaleAspectFit),
            UILabel.ch.create()
                .text("456")
                .textColor(.blue),
            UIImageView.ch.create()
                .imageNamed("test")
                .contentMode(.scaleAspectFit),
        ]}
        ]}
    }


}
