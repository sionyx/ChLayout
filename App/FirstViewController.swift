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
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let label1 = UILabel(frame: .zero)
        label1.backgroundColor = .red
        label1.text = "label1"

        let label2 = UILabel(frame: .zero)
        label2.backgroundColor = .green
        label2.text = "some long label2"

        let label3 = UILabel(frame: .zero)
        label3.backgroundColor = .blue
        label3.text = "label3"

        // 0.
        view.fillLayout {
            label1
        }

//        view.safeAreaLayout {
//            label1
//        }

        // 1.
//        view.verticalStackLayout {[
//            label1,
//            label2,
//            label3
//        ]}

        // 2.
//        view.horizontalSplitLayout {(
//            left: label1,
//            right: label2
//        )}

        // 3.
//        let container = UIView(frame: .zero)
//        container.backgroundColor = .magenta
//
//        container.horizontalSplitLayout {(
//            left: label1,
//            right: label2
//        )}
//
//        view.verticalStackLayout {[
//            container,
//            label3
//        ]}

        // 4. Universal syntax
//        view.verticalStackLayout {[
//
//            UILabel.ch.create()
//                .ch.set(\.backgroundColor, .blue)
//                .ch.set(\.text, "label1")
//                .ch.set(\.layer.borderWidth, 1),
//            UILabel.ch.create()
//                .ch.setup {
//                    $0.backgroundColor = .blue
//                    $0.text = "Label2"
//                    $0.layer.borderWidth = 1
//                }
//        ]}

        // 5. Call methods
//        view.verticalStackLayout {[
//            UILabel.ch.create()
//                .ch.perform(#selector(UIView.sizeToFit)),
//            UILabel.ch.create()
//                .ch.exec(\.myConfigureFont)
//        ]}



//        view!.fillLayout(maxWidth: 500) {
//            UIView.ch.create()
//                .backgroundColor(.yellow)
//                .verticalSplitLayout {(
//                top: UILabel.ch.create()
//                    .text("ChLayout")
//                    .margins(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
//                    .backgroundColor(.green)
//                    .font(.systemFont(ofSize: 32, weight: .light)),
//                bottom: UIScrollView.ch.create()
//                    .bounceVertical(true)
//                    .backgroundColor(.purple)
//                    .scrollableVerticalStackLayout {[
//                        UILabel.ch.create()
//                            .ch.named(&header)
//                            .text("123")
//                            .textColor(.blue),
//                        UIImageView.ch.create()
//                            .imageNamed("test")
//                            .contentMode(.scaleAspectFit),
//                        CustomView.ch.fromXib()
//                            .ch.named(&customView)
//                            .margins(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
//                            .ch.setup {
//                                $0.textLabel.textColor = UIColor.darkGray
//                            }
//                    ]}
//            )}
//        }

//        print("header \(String(describing: header))")
//        print("customView \(String(describing: customView))")
    }

}

extension UILabel {
    var myConfigureFont: (() -> Void) {
        return _myConfigureFont
    }

    private func _myConfigureFont() {
        font = UIFont.systemFont(ofSize: 24)
    }
}
