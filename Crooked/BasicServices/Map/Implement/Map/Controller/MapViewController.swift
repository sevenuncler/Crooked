//
//  MapViewController.swift
//  Crooked
//
//  Created by fanghe on 2021/12/5.
//

import UIKit

// 1. 获取当前中心位置，请求当前位置附近2公里的数据,数据刷新分别在地图和列表里展示(可做本地缓存)
// 2. 移动地图时，停止拖动时请求数据
// 3. 列表和地图联动
// 4. 点击目标地可以进行导航

class MapViewController: UIViewController {
    var dataController: AnchorListDataController
    var mapServie: MapServiceImpl = MapServiceImpl()
    lazy var viewModel: MapViewModel = {
        return MapViewModel(dataController: dataController)
    } ()
    
    init(dataController: AnchorListDataController) {
        self.dataController = dataController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mapServie.loadMap(MapModel())!)
        mapServie.update(mode: MapModel())
        dataController.registerBlock { type, list in
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshWithCurrentPosition()
    }
    
    // MARK: Business
    func refreshWithCurrentPosition() {
        viewModel.fetch(position: CGPoint.zero, completion: {
            self.mapServie.update(mode: MapModel())
        })
    }
    
    func refreshCurrentPosition() -> CGPoint {
        return CGPoint.zero
    }
}
