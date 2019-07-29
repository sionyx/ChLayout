//
//  FirstViewController.swift
//  chlayout
//
//  Created by Вадим Балашов on 21/07/2019.
//  Copyright © 2019 sionyx.ru. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var header: UILabel!
    var customView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view!.safeAreaLayout {
            UIView.ch.create().zeroMargins().backgroundColor(.yellow).verticalSplitLayout {(
                top: UILabel.ch.create()
                    .text("ChLayout")
                    .margins(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
                    .backgroundColor(.green)
                    .font(.systemFont(ofSize: 32, weight: .light)),
                bottom: UIScrollView.ch.create()
                    .bounceVertical(true)
                    .backgroundColor(.purple)
                    .zeroMargins()
                    .scrollableVerticalStackLayout {[
                        UILabel.ch.create()
                            .ch.named(&header)
                            .text("123")
                            .textColor(.blue),
                        UIImageView.ch.create()
                            .imageNamed("test")
                            .contentMode(.scaleAspectFit),
                        CustomView.ch.fromXib()
                            .ch.named(&customView)
                            .margins(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
                            .ch.setup {
                                $0.textLabel.textColor = UIColor.darkGray
                            }
                    ]}
            )}
        }

        print("header \(String(describing: header))")
        print("customView \(String(describing: customView))")
    }
}
