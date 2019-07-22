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
            UIView.ch.setup {
                $0.backgroundColor = UIColor.yellow
                $0.layoutMargins = .zero
                $0.verticalSplitLayout {(
                    top: UILabel.ch.setup {
                        $0.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                        $0.backgroundColor = UIColor.green
                        $0.text = "ChLayout"
                        $0.font = UIFont.systemFont(ofSize: 32, weight: .light)
                    },
                    bottom: UIScrollView.ch.setup {
                        $0.alwaysBounceVertical = true
                        $0.backgroundColor = UIColor.purple
                        $0.layoutMargins = .zero
                        $0.scrollableVerticalStackLayout {[
                            UILabel.ch.named(&header).ch.setup {
                                $0.text = "123"
                                $0.textColor = UIColor.blue
                            },
                            UIImageView.ch.setup {
                                $0.image = UIImage(named: "test")
                                $0.contentMode = .scaleAspectFit
                            },
                            CustomView.ch.fromXibNamed(&customView).ch.setup {
                                $0.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                                $0.textLabel.textColor = UIColor.darkGray
                            }
                        ]}
                    }
                )}
            }
        }

        print("header \(String(describing: header))")
        print("customView \(String(describing: customView))")
    }
}
