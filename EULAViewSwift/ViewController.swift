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
        
        if UserDefaults.standard.object(forKey: "firstValue") == nil {
            //NO
            let alertView = EULAView(frame: view.bounds)
            view.addSubview(alertView)
            UIApplication.shared.keyWindow?.addSubview(alertView)
        }
        // Do any additional setup after loading the view.
    }


}

