//
//  MetaViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/11/29.
//

import UIKit

class MetaViewController: UIViewController {
    var mapViewController: UIViewController?
    var nearestViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        mapViewController = MapViewController()
        if mapViewController != nil {
            self.addChild(mapViewController!)
            self.view.addSubview(mapViewController!.view)
            mapViewController!.didMove(toParent: self)
        }
        
        nearestViewController = NearestTableViewController()
        if nearestViewController != nil { 
            DispatchQueue.main.async { [self] in
                self.mapViewController?.present(nearestViewController!, animated: true, completion: nil)
            }
        }
    }
}
