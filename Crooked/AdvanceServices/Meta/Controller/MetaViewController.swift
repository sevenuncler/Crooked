//
//  MetaViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/11/29.
//

import UIKit

class MetaViewController: UIViewController {
    var mapViewController: UIViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewController = MapViewController()
        if mapViewController != nil {
            self.addChild(mapViewController!)
            self.view.addSubview(mapViewController!.view)
            mapViewController!.didMove(toParent: self)
        }
    }
}
