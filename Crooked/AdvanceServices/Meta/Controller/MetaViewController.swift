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
        mapViewController = MapViewController(dataController: dataController!)
        if mapViewController != nil {
            self.addChild(mapViewController!)
            self.view.addSubview(mapViewController!.view)
            mapViewController!.didMove(toParent: self)
        }
        
        nearestViewController = NearestTableViewController(dataController: dataController!)
        if nearestViewController != nil {
            self.addChild(nearestViewController!)
            self.view.addSubview(nearestViewController!.view)
            nearestViewController!.didMove(toParent: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataController?.refresh(completion: { error, list in
            
        });
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
