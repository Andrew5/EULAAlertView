//
//  ViewController.swift
//  EULAViewSwift
//
//  Created by jabraknight on 2021/10/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let userAgreementButton = UIButton()
        userAgreementButton.frame = CGRect(x: view.center.x - 25, y: view.center.y - 25, width: 50, height: 50)
        userAgreementButton.setTitle("点击", for: .normal)
        userAgreementButton.setTitleColor(UIColor.yellow, for: .normal)
        userAgreementButton.backgroundColor = UIColor.blue
//        userAgreementButton.addTarget(self, action: Selector("clickUserAgreement"), for: .touchUpInside)
        view.addSubview(userAgreementButton)
    }
}

