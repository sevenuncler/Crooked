//
//  MapViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/5.
//

import UIKit

class MapViewController: UIViewController {

    var mapServie: MapServiceImpl = MapServiceImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mapServie.loadMap(MapModel())!)
    }
}
