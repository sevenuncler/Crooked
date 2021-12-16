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
    var dataController: AnchorListDataController?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataController = AnchorListDataController()
        mapViewController = MapViewController()
        if mapViewController != nil {
            self.addChild(mapViewController!)
            self.view.addSubview(mapViewController!.view)
            mapViewController!.didMove(toParent: self)
        }
        
        nearestViewController = NearestTableViewController(dataController: dataController!)
        if nearestViewController != nil {
            DispatchQueue.main.async { [self] in
                self.mapViewController?.present(nearestViewController!, animated: true, completion: nil)
            }
        }
    }
}
