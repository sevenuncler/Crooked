//
//  BaseNavigationController.swift
//  Crooked
//
//  Created by fanghe on 2022/7/13.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
}
