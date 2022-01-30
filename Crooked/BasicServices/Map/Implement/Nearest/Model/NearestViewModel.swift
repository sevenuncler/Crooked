//
//  NearestViewModel.swift
//  Crooked
//
//  Created by fanghe on 2021/12/7.
//

import UIKit


class NearestViewModel: NSObject {
    var mapApi: MapApi?
    var dataController: AnchorListDataController
    var notifyHandler: AnnotationNotifyHandler
    
    var nearestModels: [NearestCellModel]?
    var anchors: [Anchor]?
    
    // callback
    var didUpdate: (()->Void)?
    
    deinit {
        self.dataController.unRigisterBlock(handler: notifyHandler)
    }
    
    init(dataController: AnchorListDataController) {
        notifyHandler = { notifyType, list in
            
        }
        self.dataController = dataController
        self.dataController.registerBlock(handler: notifyHandler)
    }
    // internal
    
    
    // Network
    func fetchAnchors(finish: (Bool, [Anchor]?) -> Void) {
        let request = AnchorRequest()
        mapApi?.fetchAnchors(request: request, success: { anchorResponse in
            self.anchors = anchorResponse.anchors
            finish(true, anchors)
        }, failure: { error in
            finish(false, [])
        })
    }
    
    func append(anchor: Anchor) {
        
    }
}
